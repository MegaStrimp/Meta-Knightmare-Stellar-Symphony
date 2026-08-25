///@description MKSS - Attack - Meta Knight - Parry Big Cannonball - Step

function scr_MKSS_Attack_MetaKnight_ParryBigCannonball_Step()
{
	if (!localPause)
	{
		#region Attack Back
		if (instance_exists(target))
		{
			var cannonballOwner = owner;
			
			if (sprite_index != spr_MKSS_Attack_ChasseEmee_BigCannonball_Background)
			{
				if (scale <= .25)
				{
					sprite_index = spr_MKSS_Attack_ChasseEmee_BigCannonball_Background;
					image_index = 0;
					imageSpeed = 0;
					image_speed = 0;
					scale = 1;
					image_xscale = scale;
					image_yscale = scale;
				} 
				scale = max(scale - (.05 * speedMultFinal),.25);
			} 
			
			if (point_distance(x,y,target.x,target.y) <= 8) and (sprite_index == spr_MKSS_Attack_ChasseEmee_BigCannonball_Background)
			{
				var targetEnemyDir = sign(target.x - x);
				if (targetEnemyDir == 0) targetEnemyDir = 1;
				
				scr_MKSS_ParticleSet_BlockBreak1(x,y,-1);
				
				with (target)
				{
					if (hp > 4)
					{
						with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
						{
							owner = cannonballOwner;
							isEnemy = false;
							dmg = 4;
							canBreakBlocks = true;
							canBeFinisher = true;
							isMelee = false;
							freezeFrameForce = 2;
							enemyHurtTimerMult = 1.25;
							dirX = choose(-1,1);
							knockbackAngle = 90 - (dirX * 45);
							knockbackForce = 3;
							destroyTimer = 30;
							mask_index = spr_64x64Mask_MiddleOrigin;
							visible = false;
							attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_Impact;
						}
					}
					
					scr_MKSS_Score_Add(50);
					scr_MKSS_SpawnMetaPoint(3,x,y,depth - 1,other.owner,90);
					
					var sfx = scr_PlaySfx(snd_MKSS_EnemyHit);
					audio_sound_pitch(sfx,random_range(.85,1.15));
					
					shakeX = 4;
					
					scr_Camera_SetScreenshake(4);
					
					script_execute(enemyGetHit,id,4,3,90 - (45 * sign(x - other.x)),other.owner,other.speedMultFinal);
				}
				
				//with (obj_Attack)
				//{
				//	scr_MKSS_ParticleSet_SmallSparkle(x,y);
					
				//	if (owner == other.target) instance_destroy();
				//}
				
				instance_destroy();
			}
			else
			{
				var _spd = 1.2;
				if (point_distance(x,y,target.x,y) > _spd)
				{
					if (x <= target.x) hsp = _spd;
					if (x >= target.x) hsp = -_spd;
				} 
				else 
				{
					hsp = 0;
					x = target.x;
				}
				
				vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
				
				if (y >= target.y + 8) instance_destroy()
				
				scr_Component_SetPosition(hsp,vsp);
			}
		}
		else
		{
			instance_destroy();
		}
		#endregion
	}
}