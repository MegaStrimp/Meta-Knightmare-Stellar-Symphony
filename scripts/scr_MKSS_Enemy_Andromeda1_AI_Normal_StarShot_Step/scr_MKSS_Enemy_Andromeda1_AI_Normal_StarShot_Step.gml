///@description MKSS - Enemy - Andromeda 1 - AI - Normal - Star Shot - Step

function scr_MKSS_Enemy_Andromeda1_AI_Normal_StarShot_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Andromeda - Star Shot";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Charge Arm Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Shoot Arm Timer
		attackStateTimerMax[i] = 10;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Projectile Shot Timer
		attackStateTimerMax[i] = 20;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Post-Shot Timer
		attackStateTimerMax[i] = 20;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Charge Shot Timer
		attackStateTimerMax[i] = 90;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 120;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Star Shot Variables
		slashCountMax = 2;
		slashCount = slashCountMax;
		#endregion
		
		#region Star Shot Start
		sprite_index = spriteSet.sprIdle;
		image_index = 0;
		
		starCount = 6;
		starArm = -1;
		
		chargeShot = -1;
		
		armLB.sprite_index = spriteSet.sprArmLB_Lower;
		armLB.image_index = 0;
		
		armRB.sprite_index = spriteSet.sprArmRB_Lower;
		armRB.image_index = 0;
		
		arm[2] = true;
		arm[3] = true;
		
		armLTOffsetX = -25;
		armLTOffsetY = 3;
		armLT.sprite_index = spriteSet.sprArmLT_Palm;
		armLT.image_index = 0;
		armLTDir[0] = 1;
		armLT.depth = depth - 4;
		
		armRTOffsetX = 25;
		armRTOffsetY = 3;
		armRT.sprite_index = spriteSet.sprArmRT_Palm;
		armRT.image_index = 0;
		armRTDir[0] = 1;
		armRT.depth = depth - 4;
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
			#region Charge Arm
			case 0:
			armLTAngle = point_direction(armLT.x,armLT.y,obj_Player.x,obj_Player.y);
			armRTAngle = point_direction(armRT.x,armRT.y,obj_Player.x,obj_Player.y);
				
			if (attackStateTimer[attackState] == -1)
			{
				if (starArm)
				{
					armRT.sprite_index = spriteSet.sprArmRT_PalmCharge;
					armRT.image_index = 0;
				}
				else
				{
					armLT.sprite_index = spriteSet.sprArmLT_PalmCharge;
					armLT.image_index = 0;
				}
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState] / 2;
				attackState++;
			}
			break;
			#endregion
			
			#region Shoot Arm
			case 1:
			armLTAngle = point_direction(armLT.x,armLT.y,obj_Player.x,obj_Player.y);
			armRTAngle = point_direction(armRT.x,armRT.y,obj_Player.x,obj_Player.y);
			
			if (attackStateTimer[attackState] == -1)
			{
				if (starArm)
				{
					armRT.sprite_index = spriteSet.sprArmRT_PalmAttack;
					armRT.image_index = 0;
				}
				else
				{
					armLT.sprite_index = spriteSet.sprArmLT_PalmAttack;
					armLT.image_index = 0;
				}
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				attackState++;
			}
			break;
			#endregion
			
			#region Projectile Shot
			case 2:
			var _arm = armLT;
			if (starArm) _arm = armRT;
				
			armLTAngle = point_direction(armLT.x,armLT.y,obj_Player.x,obj_Player.y);
			armRTAngle = point_direction(armRT.x,armRT.y,obj_Player.x,obj_Player.y);
			
			if (attackStateTimer[attackState] == -1) or (_arm.image_index >= 3)
			{
				var _len = 16;
				
				with (instance_create_depth(_arm.x + lengthdir_x(_len,_arm.image_angle),_arm.y + lengthdir_y(_len,_arm.image_angle),_arm.depth - 2,obj_MKSS_Attack))
				{
					owner = other.id;
					isEnemy = true;
					dmg = 6;
					sprite_index = spr_MKSS_Attack_Andromeda1_StarShot_Main;
					mask_index = spr_MKSS_Attack_Andromeda1_StarShot_Main;
					scr_MKSS_Attack_Andromeda1_StarShot_Setup();
					angle = _arm.image_angle;
				}
				
				starCount--;
				starArm = -starArm;
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				if (starCount <= 0) attackState++;
				else attackState = 0;
			}
			break;
			#endregion
			
			#region Post-Shot
			case 3:
			if (attackStateTimer[attackState] == -1)
			{
				dirX = scr_MKSS_Enemy_DirTarget();
				
				armLTAngle = 90;
				armRTAngle = 90;
				
				with (instance_create_depth(x,armLT.y - 32,armLT.depth - 2,obj_MKSS_Attack))
				{
					owner = other.id;
					isEnemy = true;
					dmg = 12;
					sprite_index = spr_MKSS_Attack_Andromeda1_ChargeShot;
					mask_index = spr_MKSS_Attack_Andromeda1_ChargeShot;
					scr_MKSS_Attack_Andromeda1_ChargeShot_Setup();
					other.chargeShot = id;
				}
				
				scr_MKSS_UI_ParryIndicator_Create(chargeShot.x,chargeShot.y,chargeShot.depth - 1,attackStateTimerMax[attackState + 1],,chargeShot);
				
				attackState++;
			}
			break;
			#endregion
			
			#region Charge Shot
			case 4:
			armLTOffsetY -= .25;
			armRTOffsetY -= .25;
			chargeShot.y -= .25;
			
			if (attackStateTimer[attackState] == -1)
			{
				with (chargeShot)
				{
					shot = true;
					angle = point_direction(x,y,obj_Player.x,obj_Player.y);
					
					canBeParried = true;
					parryAttackIndex = global.MKSS_AttackIDs[? "metaKnight_ParryCannonball"];
				}
				
				armLTOffsetY = 3;
				armLTAngle = point_direction(armLT.x,armLT.y,obj_Player.x,obj_Player.y);
				
				armRTOffsetY = 3;
				armRTAngle = point_direction(armRT.x,armRT.y,obj_Player.x,obj_Player.y);
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 5:
			if (instance_exists(chargeShot))
			{
				if (chargeShot.spd < chargeShot.spdMax)
				{
					armLTAngle = point_direction(armLT.x,armLT.y,chargeShot.x,chargeShot.y);
					armRTAngle = point_direction(armLT.x,armLT.y,chargeShot.x,chargeShot.y);
				}
				else
				{
					var _spd = 16;
					if (point_distance(abs(armLTAngle),0,270 + (15 * dirX),0) > _spd) armLTAngle -= (_spd * dirX);
					if (armLTAngle < 0) armLTAngle += 360;
					if (armLTAngle >= 360) armLTAngle -= 360;
					if (point_distance(abs(armRTAngle),0,270 + (15 * dirX),0) > _spd) armRTAngle -= (_spd * dirX);
					if (armRTAngle < 0) armRTAngle += 360;
					if (armRTAngle >= 360) armRTAngle -= 360;
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
		
		#region Collision
		scr_Component_SetPosition(hsp,vsp);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}