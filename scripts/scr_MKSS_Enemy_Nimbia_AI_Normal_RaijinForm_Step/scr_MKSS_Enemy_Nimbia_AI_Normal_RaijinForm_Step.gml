///@description MKSS - Enemy - Nimbia - AI - Normal - Raijin Form - Step

function scr_MKSS_Enemy_Nimbia_AI_Normal_RaijinForm_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Nimbia - Raijin Form";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Transform Timer
		attackStateTimerMax[i] = 90;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Post-Transform Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Drum Rotate Timer
		attackStateTimerMax[i] = 180;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Drum Explosion Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Post-Explosion Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Fall Timer
		attackStateTimerMax[i] = 120;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Raijin Form Variables
		hasGravity = false;
		
		yTop = y-88;
		yBottom = y+8;
		yMiddle = yBottom-48;
		
		raijinSpeed = 0;
		raijinSpeedMax = 2;
		raijinSpeedAccel = .1;
		
		drumAmount = 6;
		drums[drumAmount] = -1;
		explosionAmount = 2;
		
		drumOrbitLengthMax = 108;
		drumOrbitLengthSpeed = 3;
		drumOrbitLength = 0;
		drumOrbitSpeedNormal = 4;
		drumOrbitSpeedFast = 8;
		drumOrbitSpeed = drumOrbitSpeedNormal;
		drumOrbitDir = choose(-1,1);
		
		drumPicker = choose(0,1);
		#endregion
		
		#region Raijin Form Start
		sprite_index = spriteSet.sprRaijinForm;
		image_index = 0;
		#endregion
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Functions
		function Nimbia_Raijin_Movement()
		{
			dirX = scr_MKSS_Enemy_DirTarget();
			
			raijinSpeed = clamp(raijinSpeed + (raijinSpeedAccel * dirX * speedMultFinal),-raijinSpeedMax,raijinSpeedMax);
			
			hsp = raijinSpeed;
		}
		
		function Nimbia_Raijin_DrumExplosion()
		{
			with (instance_create_depth(x,y,depth - 2,obj_MKSS_Attack))
			{
				owner = other.owner;
				isEnemy = true;
				dmg = 1;
				sprite_index = spr_MKSS_Attack_Nimbia_RaijinDrumExplosion;
				mask_index = spr_MKSS_Attack_Nimbia_RaijinDrumExplosion;
				destroyAfterAnimation = true;
			}
		}
		#endregion
		
		#region Friction
		var decelFinal = decelSlash * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		#endregion
		
		#region Attack States
		switch (attackState)
		{
			#region Transform
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				vsp = -2;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Post-Transform
			case 1:
			if (y <= yTop) and (vsp != 0)
			{
				y = yTop;
				
				vsp = 0;
				
				y = yTop + sine_between(global.currentTimePausable / 100,1,-6,6);
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				var _amount = 360/drumAmount;
				var i = 0;
				repeat(drumAmount)
				{
					with (instance_create_depth(x,y,depth + 1,obj_MKSS_Attack))
					{
						owner = other;
						isEnemy = true;
						dmg = -1;
						sprite_index = spr_MKSS_Attack_Nimbia_RaijinDrum;
						mask_index = spr_MKSS_Attack_Nimbia_RaijinDrum;
						scr_MKSS_Attack_Nimbia_RaijinDrum_Setup();
						orbitAngle = _amount*i;
						other.drums[i] = id;
					}
					i++;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Drum Rotate
			case 2:
			Nimbia_Raijin_Movement()
			drumOrbitLength = min(drumOrbitLength + (drumOrbitLengthSpeed * speedMultFinal),drumOrbitLengthMax);
			
			if (attackStateTimer[attackState] == -1)
			{
				hsp = 0;
				drumOrbitSpeed = 0;
				
				drumPicker = !drumPicker;
				
				if (!drumPicker)
				{
					with (drums[0]) 
					{
						particleTimerMax = 3;
						shake = 2;
					}
					with (drums[2]) 
					{
						particleTimerMax = 3;
						shake = 2;
					}
					with (drums[4]) 
					{
						particleTimerMax = 3;
						shake = 2;
					}
				}
				else
				{
					with (drums[1]) 
					{
						particleTimerMax = 3;
						shake = 2;
					}
					with (drums[3]) 
					{
						particleTimerMax = 3;
						shake = 2;
					}
					with (drums[5]) 
					{
						particleTimerMax = 3;
						shake = 2;
					}
				}
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				attackState++;
			}
			break;
			#endregion
			
			#region Drum Explosion
			case 3:
			if (attackStateTimer[attackState] == -1)
			{
				if (!drumPicker)
				{
					with (drums[0]) 
					{
						Nimbia_Raijin_DrumExplosion();
						shake = 0;
						particleTimerMax = -1;
					}
					with (drums[2]) 
					{
						Nimbia_Raijin_DrumExplosion();
						shake = 0;
						particleTimerMax = -1;
					}
					with (drums[4]) 
					{
						Nimbia_Raijin_DrumExplosion();
						shake = 0;
						particleTimerMax = -1;
					}
				}
				else
				{
					with (drums[1]) 
					{
						Nimbia_Raijin_DrumExplosion();
						shake = 0;
						particleTimerMax = -1;
					}
					with (drums[3]) 
					{
						Nimbia_Raijin_DrumExplosion();
						shake = 0;
						particleTimerMax = -1;
					}
					with (drums[5]) 
					{
						Nimbia_Raijin_DrumExplosion();
						shake = 0;
						particleTimerMax = -1;
					}
				}
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				attackState++;
			}
			break;
			#endregion
			
			#region Post-Explosion
			case 4:
			if (attackStateTimer[attackState] == -1)
			{
				//explosionAmount--;
				if (explosionAmount <= 0) attackState++;
				else 
				{
					raijinSpeed = 0;
					drumOrbitSpeed = drumOrbitSpeedNormal;
					
					attackStateTimer[attackState] = attackStateTimerMax[attackState];
					attackState = 2;
				}
			}
			break;
			#endregion
			
			#region Fall
			case 8:
			if (attackStateTimer[attackState] == -1) or (instance_place(x,y+vsp+1,obj_Wall))
			{
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 9:
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