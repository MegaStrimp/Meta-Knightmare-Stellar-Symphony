///@description MKSS - Enemy - Nimbia - AI - Normal - Tornado Assault - Step

function scr_MKSS_Enemy_Nimbia_AI_Normal_TornadoAssault_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Nimbia - Tornado Assault";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Rise Start Timer
		attackStateTimerMax[i] = 20;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Rise Timer
		attackStateTimerMax[i] = 180;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Tornado 1 Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Tornado 2 Timer
		attackStateTimerMax[i] = 120;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Tornado Self Timer
		attackStateTimerMax[i] = 180;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Tornado Land Timer
		attackStateTimerMax[i] = 600;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Tornado Assault Variables
		yTop = y-96;
		xTarget = room_width/2;
		
		tornadoDir = choose(-1,1);
		hasGravity = false;
		
		tornadoMoveSpeed = 0;
		tornadoMoveSpeedAccel = .1;
		tornadoMoveSpeedMax = 2;
		#endregion
		
		#region Tornado Assault Start
		sprite_index = spriteSet.sprTornado;
		image_index = 0;
		
		dirX = 1;
		if (x >= xTarget) dirX = -1;
		#endregion
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Friction
		var decelFinal = decelSlash * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		#endregion
		
		#region Attack States
		switch (attackState)
		{
			#region Rise Start
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				attackState++;
			}
			break;
			#endregion
			
			#region Rise
			case 1:
			var _spd = 2;
			dirX = 1;
			if (x >= xTarget) dirX = -1;
			if (point_distance(x,0,xTarget,0) <= _spd) 
			{
				x = xTarget;
				
				hsp = 0;
			}
			else
			{
				hsp = _spd * dirX;
			}
			if (y > yTop) vsp = -_spd;
			else
			{
				y = yTop;
				
				vsp = 0;
			}
			
			if (attackStateTimer[attackState] == -1) or ((x == xTarget) and (y <= yTop))
			{
				x = xTarget;
				y = yTop;
				
				hsp = 0;
				vsp = 0;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Tornado 1 & 2
			case 2:
			case 3:
			if (attackStateTimer[attackState] == -1)
			{
				with (instance_create_depth(x,y,depth + 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					sprite_index = spr_MKSS_Enemy_Nimbia_Base_Tornado;
					mask_index = spr_MKSS_Enemy_Nimbia_Base_Tornado;
					dirX = other.tornadoDir;
					scr_MKSS_Attack_Nimbia_Tornado_Setup(true);
					vsp = .4;
				}
				
				tornadoDir = -tornadoDir;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Tornado Self
			case 4:
			if (attackStateTimer[attackState] == -1)
			{
				vsp = .4;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Tornado Land
			case 5:
			if (x < obj_Player.x)
			{
				dirX = 1;
			}
			
			if (x > obj_Player.x)
			{
				dirX = -1
			}
			
			tornadoMoveSpeed = clamp(tornadoMoveSpeed + (tornadoMoveSpeedAccel * dirX * speedMultFinal),-tornadoMoveSpeedMax,tornadoMoveSpeedMax);
			hsp = tornadoMoveSpeed;
			
			if (attackStateTimer[attackState] == -1) or (instance_place(x,y+vsp+1,obj_Wall))
			{
				repeat(20)
				{
					scr_MKSS_ParticleSet_NimbiaCloud(x+irandom_range(-16,16),y-8+irandom_range(-16,16),random_range(-.25,.25),random_range(-1,0),-1)
				}
				
				var _dir = 1;
				repeat(2)
				{
					with (instance_create_depth(x,y,depth + 1,obj_MKSS_Attack))
					{
						owner = other;
						isEnemy = true;
						dmg = 1;
						sprite_index = spr_MKSS_Enemy_Nimbia_Base_Tornado;
						mask_index = spr_MKSS_Enemy_Nimbia_Base_Tornado;
						dirX = _dir;
						scr_MKSS_Attack_Nimbia_Tornado_Setup(false);
						hsp = 3*_dir;
					}
					_dir = -_dir;
				}
				
				sprite_index = spriteSet.sprDownThrust1;
				image_index = 3;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 6:
			if (attackStateTimer[attackState] == -1)
			{
				scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
			}
			break;
			#endregion
		}
		#endregion
		
		#region Gravity
		if (hasGravity) vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}