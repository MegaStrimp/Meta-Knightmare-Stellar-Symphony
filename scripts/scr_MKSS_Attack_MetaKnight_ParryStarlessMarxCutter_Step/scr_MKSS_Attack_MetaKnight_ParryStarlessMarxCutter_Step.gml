///@description MKSS - Attack - Meta Knight - Parry Starless Marx Cutter - Step

function scr_MKSS_Attack_MetaKnight_ParryStarlessMarxCutter_Step()
{
	if (!localPause)
	{
		#region Attack Back
		if (instance_exists(target))
		{
			var cutterX = x;
			var cutterOwner = owner;
			
			if ((point_distance(x,y,target.x,target.y) <= 8) or (place_meeting(x,y,target)))
			{
				var targetEnemyDir = sign(target.x - x);
				if (targetEnemyDir == 0) targetEnemyDir = 1;
				
				with (target)
				{
					dirX = targetEnemyDir;
					
					//scr_MKSS_ParticleSet_Explosion1(x,y); STRIMPTODO smaller explosion
					
					with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
					{
						owner = cutterOwner;
						isEnemy = false;
						dmg = 3;
						canBreakBlocks = true;
						canBeFinisher = true;
						isMelee = false;
						freezeFrameForce = 2;
						enemyHurtTimerMult = 1.25;
						dirX = sign(other.x - cutterX);
						knockbackAngle = 90 - (dirX * 45);
						knockbackForce = 3;
						destroyTimer = 30;
						mask_index = spr_64x64Mask_MiddleOrigin;
						visible = false;
						attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_Impact;
					}
					
					scr_MKSS_Score_Add(50);
					scr_MKSS_SpawnMetaPoint(3,x,y,depth - 1,other.owner,90);
					
					scr_PlaySfx(snd_MKSS_EnemyHit);
					
					shakeX = 4;
					
					scr_Camera_SetScreenshake(2);
					
					scr_MKSS_Enemy_GetHit(id,other.owner,5,90 - (45 * sign(x - other.x)),3,other.speedMultFinal);
				}
				
				instance_destroy();
			}
			else
			{
			    move_towards_point(target.x,target.y,8);
			}
		}
		else
		{
			instance_destroy();
		}
		#endregion
	}
}