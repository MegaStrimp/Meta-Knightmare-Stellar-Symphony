///@description MKSS - Enemy - Starless Marx - AI - Normal - Black Hole - Step

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_BlackHole_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Starless Marx - Black Hole";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		attackState = 0;
		
		enemyAnimationEnd = scr_MKSS_Enemy_StarlessMarx_AI_Normal_BlackHole_AnimationEnd;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Start Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Split Timer
		attackStateTimerMax[i] = 20;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Split End Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Black Hole Prepare Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Black Hole Start Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Black Hole Timer
		attackStateTimerMax[i] = 160;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Black Hole Variables
		splitL = -1;
		splitR = -1;
		
		blackHole = -1;
		suckedMeta = false;
		
		arrowTimerMax = 60;
		arrowTimer = arrowTimerMax;
		#endregion
		
		#region Black Hole Start
		sprite_index = spriteSet.sprSplit;
		image_index = 0;
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
			if (attackStateTimer[attackState] == -1)
			{
				attackState++;
			}
			break;
			#endregion
			
			#region Split
			case 1:
			if (attackStateTimer[attackState] == -1)
			{
				image_alpha = 0;
				canBeHit = false;
				
				with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = -1;
					knockbackForce = 1;
					hsp = 0;
					vsp = 3;
					sprite_index = spr_MKSS_Attack_StarlessMarx_SplitL;
					mask_index = spr_MKSS_Attack_StarlessMarx_SplitL;
					pauseAfterAnimation = true;
					image_index = 5;
					decelX = .4;
					decelY = .6;
					attackAIStep = scr_MKSS_Attack_StarlessMarx_Split_Step;
					other.splitL = id;
				}
				
				with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = -1;
					knockbackForce = 1;
					hsp = 0;
					vsp = -3;
					sprite_index = spr_MKSS_Attack_StarlessMarx_SplitR;
					mask_index = spr_MKSS_Attack_StarlessMarx_SplitR;
					pauseAfterAnimation = true;
					image_index = 5;
					decelX = .4;
					decelY = .6;
					attackAIStep = scr_MKSS_Attack_StarlessMarx_Split_Step;
					other.splitR = id;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Split End
			case 2:
			if (attackStateTimer[attackState] == -1)
			{
				with (splitL) 
				{
					hsp = -5;
					image_index = 0;
				}
				
				with (splitR)
				{
					hsp = 5;
					image_index = 0;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Black Hole Prepare
			case 3:
			if (attackStateTimer[attackState] == -1)
			{
				var sfx = scr_PlaySfx(snd_MKSS_MarxBlackHole1);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				with (splitL) 
				{
					scr_MKSS_ParticleSet_Common(x-8,y,spr_MKSS_Particle_WarpOut);
					
					instance_destroy();
				}
				
				with (splitR)
				{
					scr_MKSS_ParticleSet_Common(x+8,y,spr_MKSS_Particle_WarpOut);
					
					instance_destroy();
				}
				
				with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = -1;
					knockbackForce = 1;
					sprite_index = spr_MKSS_Attack_StarlessMarx_BlackHole;
					mask_index = spr_MKSS_Attack_StarlessMarx_BlackHole;
					scr_MKSS_Attack_StarlessMarx_BlackHole_Setup();
					other.blackHole = id;
				}
				
				y = -196;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Black Hole Start
			case 4:
			if (attackStateTimer[attackState] == -1)
			{
				instance_create_layer(0,0,"Player",obj_MKSS_Attack_BlackHole_ScreenDarken);
				
				with (blackHole)
				{
					image_index = 0;
					imageSpeed = 0;
					
					blackHoleState++;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Black Hole
			case 5:
			if (arrowTimer != -1)
			{
				arrowTimer = max(arrowTimer - speedMultFinal,0);
				if (arrowTimer == 0)
				{
					var _dir = 1;
					if (obj_Player.x <= room_width/2) _dir = -1;
					var _x = 0;
					if (_dir == -1) _x = room_width;
					
					with (instance_create_depth(_x,152,depth - 1,obj_MKSS_Attack))
					{
						owner = other;
						isEnemy = true;
						dmg = -1;
						knockbackForce = 1;
						sprite_index = spr_MKSS_Attack_StarlessMarx_Arrow1;
						mask_index = spr_MKSS_Attack_StarlessMarx_Arrow1;
						scr_MKSS_Attack_StarlessMarx_Arrow_Setup();
						accelTimer = 30;
						dmgTarget = 4;
						destroyOutsideRoom = false;
						destroyAfterCollideWall = false;
						angle = 0;
						if (_dir == -1) angle = 180;
						image_angle = angle;
						scr_MKSS_UI_ParryIndicator_Create(x,y,depth - 1,accelTimer,,id);
						parryArrow = true;
					}
					
					arrowTimer = arrowTimerMax;
				}
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				x = -216;
				
				if (suckedMeta)
				{
					with (obj_Player)
					{
						attackMakeHeavyInvincibleTimer = 15;
						
						suckState++;
						
						clampToRoom = false;
						clampToView = false;
						
						image_alpha = 1;
						
						x = room_width/2;
						y = -32;
					}
					
					suckedMeta = false;
				}
				
				with (obj_MKSS_Attack_BlackHole_ScreenDarken) destroy = true;
				
				with (blackHole)
				{
					imageSpeed = 1;
					
					destroyTimer = 30;
					
					blackHoleState++;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 6:
			if (attackStateTimer[attackState] == -1)
			{
				image_alpha = 1;
				canBeHit = true;
				
				y = -96;
				
				scr_MKSS_Enemy_StarlessMarx_Teleport((room_width/2) + irandom_range(-32,32),72 + irandom_range(-8,8),enemyAIStepIdle,,0);
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