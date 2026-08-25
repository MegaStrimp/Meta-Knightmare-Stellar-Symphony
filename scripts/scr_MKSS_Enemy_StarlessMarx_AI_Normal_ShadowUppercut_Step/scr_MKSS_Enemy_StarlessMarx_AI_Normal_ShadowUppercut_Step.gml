///@description MKSS - Enemy - Starless Marx - AI - Normal - Shadow Uppercut - Step

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_ShadowUppercut_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Starless Marx - Shadow Uppercut";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Start Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Shadow Track Timer
		attackStateTimerMax[i] = 150;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Uppercut Prepare Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Uppercut Timer
		attackStateTimerMax[i] = 80;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Arrow Timer
		attackStateTimerMax[i] = 20;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 80;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Shadow Uppercut Variables
		flySpeed = 2;
		flyAccel = .2;
		
		shadow = -1;
		shadowSpeed = 0;
		shadowAccel = .2;
		shadowDecel = .4;
		shadowSpeedMax = 5;
		shadowDir = choose(-1,1);
		
		uppercutDecel = .45;
		uppercutSpeed = -9;
		
		audioStopTimer = 18;
		#endregion
		
		#region Shadow Uppercut Start
		if (x <= -40) or (x >= room_width + 40) or (y <= -40)
		{
			attackStateTimer[attackState] = 0;
		}
		else
		{
			var sfx = scr_PlaySfx(snd_MKSS_MarxLaugh3);
			audio_sound_pitch(sfx,random_range(.85,1.15));
			
			sprite_index = spriteSet.sprFlyUp;
			image_index = 0;
		}
		#endregion
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Friction
		var decelFinal = decel * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		vsp = scr_Entity_Friction(vsp,decelFinal);
		#endregion
		
		#region Attack States
		switch (attackState)
		{
			#region Start
			case 0:
			if (y > -96) 
			{
				vsp = flySpeed;
				flySpeed -= flyAccel * speedMultFinal;
			}
			else vsp = 0;
			
			if (attackStateTimer[attackState] == -1)
			{
				vsp = 0;
				y = -96;
				
				canBeHit = false;
				
				var _x = obj_Player.x + (32 * -shadowDir);
				_x = clamp(_x,0,room_width);
				
				with (instance_create_depth(_x,160,depth + 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = -1;
					knockbackForce = 1;
					sprite_index = spr_MKSS_Attack_StarlessMarx_Shadow;
					mask_index = spr_MKSS_Attack_StarlessMarx_Shadow;
					pauseOutsideView = false;
					destroyOutsideRoom = false;
					destroyAfterCollideWall = false;
					imageSpeed = 0;
					pauseAfterAnimation = true;
					other.shadow = id;
					textureX = 0;
					textureY = 0;
					attackAIStep = scr_MKSS_Attack_StarlessMarx_Shadow_Step;
					attackDraw = scr_MKSS_Attack_StarlessMarx_Shadow_Draw;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Shadow Track
			case 1:
			with (shadow)
			{
				if (x < obj_Player.x) other.shadowDir = 1;
				if (x > obj_Player.x) other.shadowDir = -1;
				other.shadowSpeed = clamp(other.shadowSpeed + (other.shadowAccel * other.shadowDir * speedMultFinal),-other.shadowSpeedMax,other.shadowSpeedMax);
				x += other.shadowSpeed;
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				attackState++;
			}
			break;
			#endregion
			
			#region Uppercut Prepare
			case 2:
			with (shadow)
			{
				imageSpeed = 1;
				
				other.shadowSpeed = scr_Entity_Friction(other.shadowSpeed,other.shadowAccel * speedMultFinal);
				x += other.shadowSpeed;
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				with (shadow) destroyTimer = 10;
				
				x = shadow.x;
				y = shadow.y;
				
				var sfx = scr_PlaySfx(snd_MKSS_MarxLaugh2);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				var sfx = scr_PlaySfx(snd_MKSS_MarxAppear);
				audio_sound_pitch(sfx,random_range(.85,1.15));
			
				sprite_index = spriteSet.sprFlyUp;
				image_index = 0;
				
				flySpeed = uppercutSpeed;
				
				canBeHit = true;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Uppercut
			case 3:
			vsp = flySpeed;
			flySpeed = scr_Entity_Friction(flySpeed,uppercutDecel * speedMultFinal);
			
			if (attackStateTimer[attackState] == -1) or (vsp == 0)
			{
				vsp = 0;
				
				sprite_index = spriteSet.sprCharge;
				image_index = 0;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Arrow
			case 4:
			shakeX = 2;
			
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprIdle;
				image_index = 0;
				
				var sfx = scr_PlaySfx(snd_MKSS_MarxNeedle);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				var _dir = -1;
				var _angle = 225;
				repeat(2)
				{
					var i = 0;
					repeat(12)
					{
						var _offset = irandom_range(-10,10);
						
						with (instance_create_depth(x + (irandom_range(0,48) * _dir),y + irandom_range(-32,8),depth - 1,obj_MKSS_Attack))
						{
							owner = other;
							isEnemy = true;
							dmg = -1;
							knockbackForce = 1;
							sprite_index = spr_MKSS_Attack_StarlessMarx_Arrow1;
							mask_index = spr_MKSS_Attack_StarlessMarx_Arrow1;
							scr_MKSS_Attack_StarlessMarx_Arrow_Setup();
							accelTimer = 40 + (i * 3);
							dmgTarget = 4;
							destroyOutsideRoom = false;
							destroyAfterCollideWall = false;
							angle = _angle + _offset;
							image_angle = angle;
						}
						
						i++;
					}
					
					_angle += 90;
					_dir *= -1;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 5:
			if (audioStopTimer != -1)
			{
				audioStopTimer = max(audioStopTimer - speedMultFinal,0);
				if (audioStopTimer == 0)
				{
					audio_stop_sound(snd_MKSS_MarxNeedle);
					
					audioStopTimer = -1;
				}
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
			}
			break;
			#endregion
		}
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}