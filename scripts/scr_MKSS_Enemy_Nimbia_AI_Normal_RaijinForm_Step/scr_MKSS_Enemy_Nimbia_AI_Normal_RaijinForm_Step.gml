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
		attackStateTimerMax[i] = 140;
		attackStateTimer[i] = attackStateTimerMax[i]+irandom_range(-20,20);
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
		
		#region Final Drum Rotate Timer
		attackStateTimerMax[i] = 140+irandom_range(-20,20);
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Final Drum Explosion Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Final Post-Explosion Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Final Second Drum Explosion Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Final Second Post-Explosion Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Fall Timer
		attackStateTimerMax[i] = 90;
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
		drumOrbitSpeedFast = 8;
		drumOrbitSpeedNormal = 5;
		drumOrbitSpeedSlow = 1;
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
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState]+irandom_range(-20,20);
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
				explosionAmount--;
				if (explosionAmount <= 0) 
				{
					drumOrbitSpeed = drumOrbitSpeedFast;
					
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
				
					attackState++;
				}
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
			
			#region Final Drum Rotate
			case 5:
			Nimbia_Raijin_Movement()
			drumOrbitLength = min(drumOrbitLength + (drumOrbitLengthSpeed * speedMultFinal),drumOrbitLengthMax);
			
			if (attackStateTimer[attackState] == -1)
			{
				hsp = 0;
				drumOrbitSpeed = drumOrbitSpeedSlow;
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				attackState++;
			}
			break;
			#endregion
			
			#region Final Drum Explosion
			case 6:
			if (attackStateTimer[attackState] == -1)
			{
				drumOrbitSpeed = 0;
				
				if (!drumPicker)
				{
					with (drums[0]) 
					{
						Nimbia_Raijin_DrumExplosion();
						shake = 0;
						particleTimerMax = -1;
						destroyTimer = 8;
					}
					with (drums[2]) 
					{
						Nimbia_Raijin_DrumExplosion();
						shake = 0;
						particleTimerMax = -1;
						destroyTimer = 8;
					}
					with (drums[4]) 
					{
						Nimbia_Raijin_DrumExplosion();
						shake = 0;
						particleTimerMax = -1;
						destroyTimer = 8;
					}
				}
				else
				{
					with (drums[1]) 
					{
						Nimbia_Raijin_DrumExplosion();
						shake = 0;
						particleTimerMax = -1;
						destroyTimer = 8;
					}
					with (drums[3]) 
					{
						Nimbia_Raijin_DrumExplosion();
						shake = 0;
						particleTimerMax = -1;
						destroyTimer = 8;
					}
					with (drums[5]) 
					{
						Nimbia_Raijin_DrumExplosion();
						shake = 0;
						particleTimerMax = -1;
						destroyTimer = 8;
					}
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Final Post-Explosion
			case 7:
			if (attackStateTimer[attackState] == -1)
			{
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
					
				attackState++;
			}
			break;
			#endregion
			
			#region Final Second Drum Explosion
			case 8:
			if (attackStateTimer[attackState] == -1)
			{
				if (!drumPicker)
				{
					with (drums[0]) 
					{
						Nimbia_Raijin_DrumExplosion();
						shake = 0;
						particleTimerMax = -1;
						destroyTimer = 8;
					}
					with (drums[2]) 
					{
						Nimbia_Raijin_DrumExplosion();
						shake = 0;
						particleTimerMax = -1;
						destroyTimer = 8;
					}
					with (drums[4]) 
					{
						Nimbia_Raijin_DrumExplosion();
						shake = 0;
						particleTimerMax = -1;
						destroyTimer = 8;
					}
				}
				else
				{
					with (drums[1]) 
					{
						Nimbia_Raijin_DrumExplosion();
						shake = 0;
						particleTimerMax = -1;
						destroyTimer = 8;
					}
					with (drums[3]) 
					{
						Nimbia_Raijin_DrumExplosion();
						shake = 0;
						particleTimerMax = -1;
						destroyTimer = 8;
					}
					with (drums[5]) 
					{
						Nimbia_Raijin_DrumExplosion();
						shake = 0;
						particleTimerMax = -1;
						destroyTimer = 8;
					}
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Final Second Post-Explosion
			case 9:
			if (attackStateTimer[attackState] == -1)
			{
				repeat(32)
				{
					var _len = irandom_range(0,12);
					var _dir = irandom_range(0,359);
					var _spd = random_range(.5,2);
					var _x = lengthdir_x(_len,_dir);
					var _y = lengthdir_y(_len,_dir);
					scr_MKSS_ParticleSet_NimbiaCloud(x+_x,y-8+_y,lengthdir_x(_spd,_dir),lengthdir_y(_spd,_dir),-2)
				}
				
				sprite_index = spriteSet.sprDownThrust1;
				mask_index = spriteSet.maskIndexDefault;
				image_index = 0;
				
				dirX = scr_MKSS_Enemy_DirTarget();
				image_alpha = 1;
				vsp = -2;
				
				hasGravity = true;
				
				attackState++;
			}
			#endregion
			
			#region Fall
			case 10:
			if (attackStateTimer[attackState] == -1) or (instance_place(x,y+vsp+1,obj_Wall))
			{
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 11:
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