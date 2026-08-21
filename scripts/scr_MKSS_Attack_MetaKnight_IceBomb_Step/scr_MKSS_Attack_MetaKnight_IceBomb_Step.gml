///@description MKSS - Attack - Meta Knight - Ice Bomb - Step

function scr_MKSS_Attack_MetaKnight_IceBomb_Step()
{
	if (!localPause)
	{
		#region Attack Back
		if (instance_exists(target))
		{
			var parryX = x;
			var parryOwner = owner;
			
			if ((point_distance(x,y,target.x,target.y) <= 8) or (place_meeting(x,y,target)))
			{
				var targetEnemyDir = sign(target.x - x);
				if (targetEnemyDir == 0) targetEnemyDir = 1;
				
				with (target)
				{
					var _detonate = false;
					
					if (object_index == obj_MKSS_Enemy_StarlessMarx)
					{
						if (parryBack > 0)
						{
							wingOutTimer = wingOutTimerMax;
							
							scr_PlaySfx(snd_MKSS_ParryExecute);
							
							sprite_index = spriteSet.sprCharge;
							image_index = 0;
							
							scr_MKSS_ParticleSet_ParryGhost(x,y,dirX,sprite_index,,true,c_green);
							
							attackStateTimer[attackState] = attackStateTimerMax[attackState];
							
							scr_SetGlobalFreezeFrame(16);
							
							scr_PlaySfx(snd_MKSS_MarxIceBombDetonate);
							
							with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
							{
								owner = other;
								isEnemy = true;
								dmg = 1;
								knockbackForce = 1;
								var _dir = point_direction(x,y,obj_Player.x,obj_Player.y);
								var _spd = 4;
								hsp = lengthdir_x(_spd,_dir);
								vsp = lengthdir_y(_spd,_dir);
								sprite_index = spr_MKSS_Attack_StarlessMarx_IceBomb;
								mask_index = spr_MKSS_Attack_StarlessMarx_IceBomb;
								attackAIStep = scr_MKSS_Attack_StarlessMarx_IceBomb_Step;
								destroyOutsideRoom = true;
								destroyAfterCollideWall = false;
								canBeParried = true;
								parryAttackIndex = global.MKSS_AttackIDs[? "metaKnight_ParryIceBomb"];
								other.iceBomb = id;
							}
							
							parryBack--;
						}
						else _detonate = true;
					}
					else _detonate = true;
					
					if (_detonate)
					{
						scr_MKSS_ParticleSet_Explosion2(x,y);
					
						var _dir = 1;
						repeat(2)
						{
							with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
							{
								owner = other;
								isEnemy = true;
								dmg = -1;
								knockbackForce = 1;
								hsp = 6 * _dir;
								vsp = 0;
								sprite_index = spr_MKSS_Attack_StarlessMarx_IceWave;
								mask_index = spr_MKSS_Attack_StarlessMarx_IceWave;
								attackAIStep = scr_MKSS_Attack_StarlessMarx_IceWave_Step;
								destroyOutsideRoom = true;
								destroyAfterCollideWall = false;
								particleTimerMax = 5;
								particleTimer = particleTimerMax;
							}
				
							_dir = -1;
						}
			
						with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
						{
							owner = parryOwner;
							isEnemy = false;
							dmg = 4;
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
					
						scr_PlaySfx(snd_MKSS_EnemyHit);
					
						shakeX = 4;
					
						scr_Camera_SetScreenshake(4);
					
						script_execute(enemyGetHit,id,4,3,90 - (45 * sign(x - other.x)),other.owner,other.speedMultFinal);
					}
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