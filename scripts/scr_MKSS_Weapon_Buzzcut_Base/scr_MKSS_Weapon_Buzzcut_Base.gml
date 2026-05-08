///@description MKSS - Weapon - Buzzcut - Base

function scr_MKSS_Weapon_Buzzcut_Base()
{
	#region Variables
	var attackTriggered = false;
	
	var maxComboLength = 2; //STRIMPTODO Upgrades
	var hasFinisher = true; //STRIMPTODO Upgrades
	var comboCooldownToleranceMax = 5; //STRIMPTODO Upgrades
	var comboCooldownToleranceMax = 15; //STRIMPTODO Upgrades
	
	if (!hasFinisher) parryAttackFlag = false;
	#endregion
	
	#region Attack
	var canAttack = true;
	if ((hurtState == hurtStates.hurt) or
	(global.MKSS_CutsceneStopMovement)) canAttack = false;
	
	if (canAttack)
	{
		if (input_check_pressed("X",playerNum))
		{
			var comboCooldownTolerance = -1;
			if ((buzzcut_BasicCombo_Active) or (buzzcut_BasicCombo_Index > 0)) comboCooldownTolerance = comboCooldownToleranceMax;
			
			switch (buzzcut_BasicCombo_Index)
			{
				case 0:
				if ((!isAttacking) and (attackCooldown <= comboCooldownTolerance))
				{
					if (maxComboLength > 1)
					{
						buzzcut_BasicCombo_Index = 1;
						buzzcut_BasicCombo_Timer = buzzcut_BasicCombo_TimerMax;
					}
					else
					{
						buzzcut_BasicCombo_Index = 0;
						buzzcut_BasicCombo_Timer = -1;
					}
							
					attackTriggered = true;
					attackIndex = global.MKSS_AttackIDs[? "buzzcut_Slash1"];
							
					script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
					
					if (buzzcut_BasicCombo_Active) buzzcut_Finisher_Timer = buzzcut_Finisher_TimerMax;
				}
				break;
						
				case 1:
				if ((!isAttacking) and (attackCooldown <= comboCooldownTolerance))
				{
					buzzcut_BasicCombo_Index = 0;
					buzzcut_BasicCombo_Timer = buzzcut_BasicCombo_TimerMax;
					buzzcut_BasicCombo_Active = true;
							
					attackTriggered = true;
					attackIndex = global.MKSS_AttackIDs[? "buzzcut_Slash2"];
							
					script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
							
					buzzcut_Finisher_Timer = buzzcut_Finisher_TimerMax;
				}
				break;
			}
		}
		
		if (input_check_pressed("B",playerNum))
		{
			if (buzzcut_Finisher_Timer != -1)
			{
				attackTriggered = true;
				attackIndex = global.MKSS_AttackIDs[? "buzzcut_Finisher"];
				
				script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
				
				buzzcut_BasicCombo_Index = 0;
				buzzcut_BasicCombo_Timer = -1;
				buzzcut_Finisher_Timer = -1;
			}
		}
		
		if ((hasFinisher) and ((input_check_pressed("B",playerNum)) and (canParryAttackTimer != -1) and (!isAttacking) and (attackCooldown == -1)) or (parryAttackFlag))
		{
			attackTriggered = true;
			attackIndex = global.MKSS_AttackIDs[? "buzzcut_Finisher"];
			
			script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
			
			canParryAttackTimer = -1;
			parryAttackFlag = false;
			buzzcut_Finisher_Timer = -1;
		}
	}
	#endregion
	
	#region Attack Triggered
	if (attackTriggered)
	{
		buzzcut_Run_Timer = 0;
	}
	#endregion
	
	#region Buzzcut - Basic Combo - Timer
	if (buzzcut_BasicCombo_Timer != -1)
	{
		buzzcut_BasicCombo_Timer = max(buzzcut_BasicCombo_Timer - speedMultFinal,0);
		if (buzzcut_BasicCombo_Timer == 0)
		{
			buzzcut_BasicCombo_Index = 0;
			buzzcut_BasicCombo_Active = false;
			
			buzzcut_BasicCombo_Timer = -1;
		}
	}
	#endregion
	
	#region Buzzcut - Finisher - Timer
	if (buzzcut_Finisher_Timer != -1)
	{
		buzzcut_Finisher_Timer = max(buzzcut_Finisher_Timer - speedMultFinal,0);
		if (buzzcut_Finisher_Timer == 0)
		{
			buzzcut_Finisher_Timer = -1;
		}
	}
	#endregion
}