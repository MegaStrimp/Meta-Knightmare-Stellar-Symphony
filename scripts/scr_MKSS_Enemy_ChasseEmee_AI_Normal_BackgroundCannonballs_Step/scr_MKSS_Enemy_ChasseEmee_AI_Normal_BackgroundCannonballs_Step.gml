///@description MKSS - Enemy - Chasse Emee - AI - Normal - Background Cannonballs - Step

function scr_MKSS_Enemy_ChasseEmee_AI_Normal_BackgroundCannonballs_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Chasse-Emee - Background Cannonballs";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Prepare Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Prepare Cannonballs Timer
		attackStateTimerMax[i] = 240;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Fire Cannonballs Timer
		attackStateTimerMax[i] = 80;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Go Under Start Timer
		attackStateTimerMax[i] = 20;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Go Under Timer
		attackStateTimerMax[i] = 90;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 50;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Background Cannonballs Variables
		cannonballAmount = 5;
		
		startDir = dirX;
		startY = y;
		
		hasGravity = false;
		#endregion
		
		#region Background Cannonballs Start
		sprite_index = spriteSet.sprLookDown;
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
		#endregion
		
		#region Attack States
		switch (attackState)
		{
			#region Prepare
			case 0:
			hsp = -3 * dirX;
			
			if (attackStateTimer[attackState] == -1)
			{
				layer = layer_get_id("BackgroundChasse");
				
				sprite_index = spriteSet.sprShipBackground;
				mask_index = spriteSet.sprShipBackground;
				
				if (dirX == 1) x = -32;
				else x = room_width + 32;
				y = 130;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Prepare Cannonballs
			case 1:
			hsp = .75 * dirX;
			
			var _range = 52;
			if (attackStateTimer[attackState] == -1) or ((dirX == 1) and (x >= obj_Player.x - _range)) or ((dirX == -1) and (x <= obj_Player.x + _range))
			{
				attackState++;
			}
			break;
			#endregion
			
			#region Fire Cannonballs
			case 2:
			hsp = .75 * dirX
			
			if (attackStateTimer[attackState] == -1)
			{
				dirX = scr_MKSS_Enemy_DirTarget();
				
				var sfx = scr_PlaySfx(snd_MKSS_BlockBreak);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				scr_MKSS_ParticleSet_BlockBreak1(x,y,depth - 1);
				
				with (instance_create_depth(x,y,depth - 4,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					sprite_index = spr_MKSS_Attack_ChasseEmee_BigCannonball_Background;
					mask_index = spr_MKSS_Attack_ChasseEmee_BigCannonball_Background;
					hsp = 0;
					vsp = -4;
					destroyOutsideRoom = false;
					attackAIStep = scr_MKSS_Attack_ChasseEmee_BigCannonball_Step;
				}
				
				with (instance_create_layer(x,y,"Enemies",obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					sprite_index = spr_MKSS_Attack_ChasseEmee_BigCannonball_Background;
					mask_index = spr_MKSS_Attack_ChasseEmee_BigCannonball_Background;
					hsp = 1.75 * other.dirX;
					vsp = -4;
					destroyOutsideRoom = false;
					attackAIStep = scr_MKSS_Attack_ChasseEmee_BigCannonball_Step;
				}
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				cannonballAmount--;
				if (cannonballAmount <= 0) attackState++;
			}
			break;
			#endregion
			
			#region Go Under Start
			case 3:
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprShipBackgroundAppear;
				image_index = 9;
				imageSpeed = -1;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Go Under
			case 4:
			if (image_index <= 0)
			{
				image_alpha = 0;
				
				imageSpeed = 1;
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				layer = layer_get_id("Enemies");
				
				image_alpha = 1;
				imageSpeed = 1;
				
				dirX = startDir;
				
				sprite_index = spriteSet.sprIdle;
				image_index = 0;
				mask_index = spriteSet.maskIndexDefault;
				
				x = -96;
				if (dirX == -1) x = room_width+96;
				y = startY;
				
				hsp = 5.6 * dirX;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 5:
			if (attackStateTimer[attackState] == -1)
			{
				hsp = 0;
				
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
		scr_Entity_Collision(hasGravity,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}