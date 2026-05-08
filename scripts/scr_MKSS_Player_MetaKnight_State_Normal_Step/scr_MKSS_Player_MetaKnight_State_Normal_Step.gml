///@description MKSS - Player - Meta Knight - State - Normal - Step

function scr_MKSS_Player_MetaKnight_State_Normal_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		isRunning = false;
		runBuffer = -1;
		runTurnBuffer = -1;
		runParticleTimer = -1;
		fallDuckTimer = -1;
		walkSquishTimer = -1;
		fallHopTimer = -1;
		canFallHop = false;
		fallHopJumped = false;
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Run
		scr_MKSS_Player_Component_Run();
		#endregion
		
		#region Movement
		scr_MKSS_Player_Component_Movement();
		#endregion
		
		#region Jump
		scr_MKSS_Player_Component_Jump();
		#endregion
		
		#region Gravity
		scr_MKSS_Player_Component_Gravity();
		#endregion
		
		#region Duck
		var canDuck = true;
		if (global.MKSS_CutsceneStopMovement) canDuck = false
		
		if ((canDuck) and (input_check("down",playerNum)) and (grounded) and (!isAttacking) and (!input_check("up",playerNum)))
		{
			scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Duck_Step);
			
			movespeed = clamp(movespeed,-movespeedNormal,movespeedNormal);
			isRunning = false;
		}
		#endregion
		
		#region Parry
		var canParry = true;
		if (global.MKSS_CutsceneStopMovement) canParry = false;
		
		if ((canParry) and (parryCooldownTimer == -1) and ((input_check_pressed("LT",playerNum)) or (input_check_pressed("RT",playerNum))) and (!isAttacking))
		{
			scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Parry_Step);
			
			parryCooldownTimer = parryCooldownTimerMax;
			movespeed = 0;
		}
		#endregion
		
		#region Enter Door
		scr_MKSS_Player_Interaction_Door(scr_MKSS_Player_MetaKnight_State_DoorEnter_Step);
		#endregion
		
		#region Activate Pedestal
		scr_MKSS_Player_Interaction_Pedestal();
		#endregion
		
		#region Attack
		if (currentAbility != -1)
		{
			script_execute(global.MKSS_WeaponList[currentAbility].baseScript);
		}
		/*var canAttack = true;
		if (hurtState == hurtStates.hurt) canAttack = false;
		
		if (canAttack)
		{
			switch (currentAbility)
			{
				#region Galaxia
				case MKSS_PlayerAbilities.galaxia:
				if (input_check_pressed("X",playerNum))
				{
					#region Slash 2
					if (((attackIndex == MKSS_PlayerAttacks.galaxia_Slice1) or ((attackIndexPrevious == MKSS_PlayerAttacks.galaxia_Slice1) and (attackIndex == -1) and (attackCooldown != -1))) and (attackCancelTimer <= 25))
					{
						scr_MKSS_Attack_Execute_Player_Galaxia_Slash2();
					}
					#endregion
					
					if (!isAttacking)
					{
						if (input_check("up",playerNum))
						{
							#region Up Attack
							if (attackCooldown == -1)
							{
								scr_MKSS_Attack_Execute_Player_Galaxia_UpAttack();
							}
							#endregion
						}
						else if (input_check("down",playerNum))
						{
							#region Down Attack
							if (attackCooldown == -1)
							{
								scr_MKSS_Attack_Execute_Player_Galaxia_DownAttackLight();
							}
							#endregion
						}
						else
						{
							#region Slash 1
							if (attackCooldown == -1)
							{
								scr_MKSS_Attack_Execute_Player_Galaxia_Slash1();
							}
							#endregion
						}
					}
				}
				
				if (input_check_pressed("B",playerNum))
				{
					if (input_check("down",playerNum))
					{
						#region Parry
						if (!isAttacking)
						{
							if (attackCooldown == -1)
							{
								scr_MKSS_Attack_Execute_Player_Galaxia_Parry();
							}
						}
						#endregion
					}
					else
					{
						#region Mach Tornado
						if (!isAttacking)
						{
							if ((attackCooldown == -1) and (attackCooldownSpecial == -1))
							{
								scr_MKSS_Attack_Execute_Player_Galaxia_MachTornado();
							}
						}
						#endregion
					}
				}
				break;
				#endregion
				
				#region Buzzcut
				case MKSS_PlayerAbilities.buzzcut:
				if (input_check_pressed("X",playerNum))
				{
					if (((attackIndex == MKSS_PlayerAttacks.buzzcut_Slice2) or ((attackIndexPrevious == MKSS_PlayerAttacks.buzzcut_Slice2) and (attackCooldown != -1))) and (attackCancelTimer <= 5))
					{
						scr_MKSS_Attack_Execute_Player_Buzzcut_Slash3();
					}
					
					if (((attackIndex == MKSS_PlayerAttacks.buzzcut_Slice1) or ((attackIndexPrevious == MKSS_PlayerAttacks.buzzcut_Slice1) and (attackCooldown != -1))) and (attackCancelTimer <= 5))
					{
						scr_MKSS_Attack_Execute_Player_Buzzcut_Slash2();
					}
					
					if (!isAttacking)
					{
						if (attackCooldown == -1)
						{
							scr_MKSS_Attack_Execute_Player_Buzzcut_Slash1();
						}
				
					}
				}
				break;
				#endregion
			}
		}*/
		#endregion
		
		#region Fall Roll
		scr_MKSS_Player_Component_FallRoll_Step(spriteSet.sprRoll);
		#endregion
		
		#region Animation
		if (!hasAttackAnimation)
		{
			if (hurtState == hurtStates.hurt)
			{
				switch (hurtElement)
				{
					default:
					sprite_index = spriteSet.sprHurtNormal;
					break;
					
					case MKSS_HurtElements.shocked:
					sprite_index = spriteSet.sprHurtShocked;
					break;
					
					case MKSS_HurtElements.burned:
					sprite_index = spriteSet.sprHurtBurned;
					break;
					
					case MKSS_HurtElements.frozen:
					sprite_index = spriteSet.sprHurtFrozen;
					break;
				}
			}
			else
			{
				if (grounded)
				{
				    if ((hsp == 0) and (runTurnBuffer == -1))
					{
						if (!isWalking) sprite_index = spriteSet.sprIdle;
					}
					else
					{
						if (isRunning)
						{
							if (runTurnBuffer != -1)
							{
								sprite_index = spriteSet.sprRunTurn;
							}
							else
							{
								sprite_index = spriteSet.sprRun;
							}
						}
						else
						{
							sprite_index = spriteSet.sprWalk;
						}
					}
				}
				else
				{
					var sprAirFinal = sprite_index;
					
					if (isFlying)
					{
						if (sprite_index != spriteSet.sprFlap) sprAirFinal = spriteSet.sprFloat;
					}
					else
					{
						if (vsp < 0)
						{
							sprAirFinal = spriteSet.sprJump;
						}
						else
						{
							if (canFallRoll)
							{
								sprAirFinal = spriteSet.sprRoll;
							}
							else
							{
								sprAirFinal = spriteSet.sprFall;
							}
						}
					}
					
					sprite_index = sprAirFinal;
				}
			}
		}
		#endregion
		
		#region Fall Duck
		scr_MKSS_Player_Component_FallDuck_Step(spriteSet.sprDuck);
		#endregion
		
		#region Up Duck
		scr_MKSS_Player_Component_UpDuck_Step(spriteSet.sprUpDuck);
		#endregion
		
		#region Walk Squish
		scr_MKSS_Player_Component_WalkSquish_Step(spriteSet.sprSquish);
		#endregion
		
		#region Fall Hop
		scr_MKSS_Player_Component_FallHop_Step(spriteSet.sprFallHop);
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}