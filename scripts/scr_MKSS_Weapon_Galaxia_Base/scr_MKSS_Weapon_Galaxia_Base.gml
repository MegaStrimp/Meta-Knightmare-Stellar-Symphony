///@description MKSS - Weapon - Galaxia - Base

function scr_MKSS_Weapon_Galaxia_Base()
{
	#region Variables
	var attackTriggered = false;
	
	var maxComboLength = (scr_MKSS_Player_CheckUpgrade(playerNum,"Galaxia_Kick") + scr_MKSS_Player_CheckUpgrade(playerNum,"Galaxia_Barrage"));
	var hasFinisher = scr_MKSS_Player_CheckUpgrade(playerNum,"Galaxia_Finisher");
	var hasExtraFinisher = scr_MKSS_Player_CheckUpgrade(playerNum,"Galaxia_ExtraFinisher");
	var hasMachTornado = scr_MKSS_Player_CheckUpgrade(playerNum,"Galaxia_MachTornado");
	var hasStab = scr_MKSS_Player_CheckUpgrade(playerNum,"Galaxia_Stab");
	var hasCircleSlash = scr_MKSS_Player_CheckUpgrade(playerNum,"Galaxia_CircleSlash");
	var hasGroundPound = scr_MKSS_Player_CheckUpgrade(playerNum,"Galaxia_GroundPound");
	var hasUpJuggle = scr_MKSS_Player_CheckUpgrade(playerNum,"Galaxia_UpJuggle");
	
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
			if ((hasUpJuggle) and (input_check("up",playerNum)))
			{
				if ((!isAttacking) and (attackCooldown == -1))
				{
					attackTriggered = true;
					attackIndex = global.MKSS_AttackIDs[? "galaxia_UpThrust"];
					
					script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
				}
			}
			else if ((hasGroundPound) and (input_check("down",playerNum)) and (!isDucking))
			{
				if ((!isAttacking) and (attackCooldown == -1))
				{
					attackTriggered = true;
					attackIndex = global.MKSS_AttackIDs[? "galaxia_DownThrust"];
					
					script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
				}
			}
			else if ((!grounded) and (!isFlying) and (isRunning))
			{
				if ((hasCircleSlash) and (!isAttacking) and (attackCooldown == -1))
				{
					attackTriggered = true;
					attackIndex = global.MKSS_AttackIDs[? "galaxia_CircleSlash"];
					
					script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
				}
			}
			else
			{
				if (galaxia_Run_Index == 2)
				{
					if ((hasStab) and (!isAttacking) and (attackCooldown == -1))
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
							if (maxComboLength > 0)
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
							if (maxComboLength > 1)
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
							
							galaxia_Finisher_Timer = floor(galaxia_Finisher_TimerMax * 2);
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
				
				script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript,hasExtraFinisher);
				
				galaxia_BasicCombo_Index = 0;
				galaxia_BasicCombo_Timer = -1;
				galaxia_Finisher_Timer = -1;
			}
			else if ((hasMachTornado) and (attackCooldownSpecial == -1))
			{
				attackTriggered = true;
				attackIndex = global.MKSS_AttackIDs[? "galaxia_MachTornado"];
				
				script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
			}
		}
		
		if ((hasFinisher) and ((input_check_pressed("B",playerNum)) and (canParryAttackTimer != -1) and (!isAttacking) and (attackCooldown == -1)) or (parryAttackFlag))
		{
			attackTriggered = true;
			attackIndex = global.MKSS_AttackIDs[? "galaxia_Finisher"];
			
			script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript,hasExtraFinisher);
			
			canParryAttackTimer = -1;
			parryAttackFlag = false;
			galaxia_Finisher_Timer = -1;
		}
		
		if (input_check_pressed("Y",playerNum))
		{
			if (global.MKSS_CurrentMassDestructionObject != -1)
			{
				instance_create_depth(0,0,0,global.MKSS_CurrentMassDestructionObject);
				
				global.MKSS_SpecialCurrent = 0;
			}
			else if ((global.MKSS_SpecialCurrent == global.MKSS_SpecialTarget) and (!global.MKSS_SpecialDeflation))
			{
				scr_PlaySfx(snd_MKSS_MetaHeal);
				
				metaHealParticleAmount = 0;
				metaHealParticleTimer = 0;
				
				scr_MKSS_UI_SpecialActionText_Create(spr_MKSS_UI_SpecialActionText_MetaHeal);
				
				global.MKSS_SpecialCurrent = 0;
				
				scr_MKSS_Player_Heal(playerNum,floor(global.playerMaxHp[playerNum] * .25),true);
			}
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