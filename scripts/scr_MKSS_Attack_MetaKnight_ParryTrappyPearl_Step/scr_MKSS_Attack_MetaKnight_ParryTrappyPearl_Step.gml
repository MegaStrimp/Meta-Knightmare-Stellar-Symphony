///@description MKSS - Attack - Meta Knight - Parry Trappy Pearl - Step

function scr_MKSS_Attack_MetaKnight_ParryTrappyPearl_Step()
{
	if (!localPause)
	{
		#region Attack Back
		if (instance_exists(target))
		{
			var pearlX = x;
			
			if ((point_distance(x,y,target.x,target.y) <= 8) or (place_meeting(x,y,target)))
			{
				var targetEnemyDir = sign(target.x - x);
				if (targetEnemyDir == 0) targetEnemyDir = 1;
				
				with (target)
				{
					dirX = targetEnemyDir;
					scr_MKSS_Enemy_Trappy_AI_Naked_Setup();
					scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_Trappy_AI_Naked_Step);
					
					scr_MKSS_ParticleSet_Explosion2(x,y);
					
					with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
					{
						owner = id;
						isEnemy = false;
						dmg = 3;
						canBreakBlocks = true;
						canBeFinisher = true;
						isMelee = false;
						freezeFrameForce = 2;
						enemyHurtTimerMult = 1.25;
						dirX = sign(other.x - pearlX);
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
					
					scr_Camera_SetScreenshake(4);
					
					scr_MKSS_Enemy_GetHit(id,other.owner,5,90 - (45 * sign(x - other.x)),3,other.speedMultFinal);
				}
				
				with (obj_Attack)
				{
					scr_MKSS_ParticleSet_SmallSparkle(x,y);
					
					if (owner == other.target) instance_destroy();
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