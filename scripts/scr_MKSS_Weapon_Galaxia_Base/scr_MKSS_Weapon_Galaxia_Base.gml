///@description MKSS - Weapon - Galaxia - Base

function scr_MKSS_Weapon_Galaxia_Base()
{
	#region Variables
	var attackTriggered = false;
	
	var maxComboLength = 2; //STRIMPTODO Upgrades
	var hasFinisher = true; //STRIMPTODO Upgrades
	
	if (!hasFinisher) parryAttackFlag = false;
	#endregion
	
	#region Run
	if ((input_check_pressed("left",playerNum)) or (input_check_pressed("right",playerNum)))
	{
		galaxia_Run_Index = min(galaxia_Run_Index + 1,2);
		galaxia_Run_Timer = galaxia_Run_TimerMax;
	}
	#endregion
	
	#region Attack
	var canAttack = true;
	if ((hurtState == hurtStates.hurt) or
	(global.MKSS_CutsceneStopMovement)) canAttack = false;
	
	if (canAttack)
	{
		if (input_check_pressed("X",playerNum))
		{
			if (input_check("up",playerNum))
			{
				if ((!isAttacking) and (attackCooldown == -1))
				{
					attackTriggered = true;
					attackIndex = global.MKSS_AttackIDs[? "galaxia_UpThrust"];
					
					script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
				}
			}
			else if (input_check("down",playerNum))
			{
				if ((!isAttacking) and (attackCooldown == -1))
				{
					attackTriggered = true;
					attackIndex = global.MKSS_AttackIDs[? "galaxia_DownThrust"];
					
					script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
				}
			}
			else
			{
				if (galaxia_Run_Index == 2)
				{
					if ((!isAttacking) and (attackCooldown == -1))
					{
						attackTriggered = true;
						attackIndex = global.MKSS_AttackIDs[? "galaxia_Stab"];
						
						script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
					}
				}
				else
				{
					switch (galaxia_BasicCombo_Index)
					{
						case 0:
						if ((!isAttacking) and (attackCooldown == -1))
						{
							if (maxComboLength > 1)
							{
								galaxia_BasicCombo_Index = 1;
								galaxia_BasicCombo_Timer = galaxia_BasicCombo_TimerMax;
							}
							else
							{
								galaxia_BasicCombo_Index = 0;
								galaxia_BasicCombo_Timer = -1;
							}
							
							attackTriggered = true;
							attackIndex = global.MKSS_AttackIDs[? "galaxia_Chop"];
							
							script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
							
							galaxia_Finisher_Timer = -1;
						}
						break;
						
						case 1:
						if ((!isAttacking) and (attackCooldown <= 15))
						{
							if (maxComboLength > 2)
							{
								galaxia_BasicCombo_Index = 2;
								galaxia_BasicCombo_Timer = galaxia_BasicCombo_TimerMax;
							}
							else
							{
								galaxia_BasicCombo_Index = 0;
								galaxia_BasicCombo_Timer = -1;
							}
							
							attackTriggered = true;
							attackIndex = global.MKSS_AttackIDs[? "galaxia_Kick"];
							
							script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
							
							galaxia_Finisher_Timer = galaxia_Finisher_TimerMax;
						}
						break;
						
						case 2:
						if ((!isAttacking) and (attackCooldown <= 15))
						{
							galaxia_BasicCombo_Index = 0;
							galaxia_BasicCombo_Timer = -1;
							
							attackTriggered = true;
							attackIndex = global.MKSS_AttackIDs[? "galaxia_Multisword"];
							
							script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
							
							galaxia_Finisher_Timer = galaxia_Finisher_TimerMax;
						}
						break;
					}
				}
			}
		}
		
		if (input_check_pressed("B",playerNum))
		{
			if (galaxia_Finisher_Timer != -1)
			{
				attackTriggered = true;
				attackIndex = global.MKSS_AttackIDs[? "galaxia_Finisher"];
				
				script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
				
				galaxia_BasicCombo_Index = 0;
				galaxia_BasicCombo_Timer = -1;
				galaxia_Finisher_Timer = -1;
			}
			else
			{
				attackTriggered = true;
				//attackIndex = global.MKSS_AttackIDs[? "galaxia_MachTornado"];
				
				//script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
			}
		}
		
		if ((hasFinisher) and ((input_check_pressed("B",playerNum)) and (canParryAttackTimer != -1) and (!isAttacking) and (attackCooldown == -1)) or (parryAttackFlag))
		{
			attackTriggered = true;
			attackIndex = global.MKSS_AttackIDs[? "galaxia_Finisher"];
			
			script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
			
			canParryAttackTimer = -1;
			parryAttackFlag = false;
			galaxia_Finisher_Timer = -1;
		}
	}
	#endregion
	
	#region Attack Triggered
	if (attackTriggered)
	{
		galaxia_Run_Timer = 0;
	}
	#endregion
	
	#region Galaxia - Basic Combo - Timer
	if (galaxia_BasicCombo_Timer != -1)
	{
		galaxia_BasicCombo_Timer = max(galaxia_BasicCombo_Timer - speedMultFinal,0);
		if (galaxia_BasicCombo_Timer == 0)
		{
			galaxia_BasicCombo_Index = 0;
			
			galaxia_BasicCombo_Timer = -1;
		}
	}
	#endregion
	
	#region Galaxia - Finisher - Timer
	if (galaxia_Finisher_Timer != -1)
	{
		galaxia_Finisher_Timer = max(galaxia_Finisher_Timer - speedMultFinal,0);
		if (galaxia_Finisher_Timer == 0)
		{
			galaxia_Finisher_Timer = -1;
		}
	}
	#endregion
	
	#region Galaxia - Run - Timer
	if (galaxia_Run_Timer != -1)
	{
		galaxia_Run_Timer = max(galaxia_Run_Timer - speedMultFinal,0);
		if (galaxia_Run_Timer == 0)
		{
			galaxia_Run_Index = 0;
			
			galaxia_Run_Timer = -1;
		}
	}
	#endregion
}