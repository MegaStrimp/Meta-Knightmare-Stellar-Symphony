///@description MKSS - Attack - Meta Knight - Parry Marx Arrow - Step

function scr_MKSS_Attack_MetaKnight_ParryMarxArrow_Step()
{
	if (!localPause)
	{
		#region Attack Back
		if (instance_exists(target))
		{
			var parryX = x;
			var parryOwner = owner;
			
			if ((point_distance(x,y,target.x,target.y) <= 8) or (place_meeting(x,y,target))) and (target.canBeHit)
			{
				var targetEnemyDir = sign(target.x - x);
				if (targetEnemyDir == 0) targetEnemyDir = 1;
				
				with (target)
				{
					scr_MKSS_ParticleSet_Explosion2(x,y);
					
					with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
					{
						owner = parryOwner;
						isEnemy = false;
						dmg = 4;
						bonusValue = MKSS_Base_AttackBonusValue;
						canBreakBlocks = true;
						canBeFinisher = true;
						isMelee = false;
						freezeFrameForce = 2;
						enemyHurtTimerMult = 1.25;
						dirX = sign(other.x - parryX);
						knockbackAngle = 90 - (dirX * 45);
						knockbackForce = 3;
						destroyTimer = 30;
						mask_index = spr_64x64Mask_MiddleOrigin;
						visible = false;
						attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_Impact;
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
				hsp = lengthdir_x(spd,angle);
				vsp = lengthdir_y(spd,angle);
				
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