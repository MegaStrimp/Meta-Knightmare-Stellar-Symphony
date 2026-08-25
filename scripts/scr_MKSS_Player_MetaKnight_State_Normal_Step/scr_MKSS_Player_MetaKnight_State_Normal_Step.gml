///@description MKSS - Player - Meta Knight - State - Normal - Step

function scr_MKSS_Player_MetaKnight_State_Normal_Step()
{
	#region Variables
	var hasSonicWings = scr_MKSS_Player_CheckUpgrade(playerNum,"Base_SonicWings");
	#endregion
	
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
		if ((global.MKSS_CutsceneStopMovement)
		or (hurtState == hurtStates.hurt)) canDuck = false
		
		if ((canDuck) and (grounded) and (!isAttacking) and (((input_check("down",playerNum)) and (!input_check("up",playerNum))) or (place_meeting(x,y,obj_Wall))))
		{
			scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Duck_Step);
			
			movespeed = clamp(movespeed,-movespeedNormal,movespeedNormal);
			isRunning = false;
		}
		#endregion
		
		#region Afterimage
		var hasAfterimage = ((isFlying) and (hasSonicWings));
		
		if ((afterimageTimer == -1) and (hasAfterimage)) afterimageTimer = afterimageTimerMax;
		#endregion
		
		#region Parry
		var hasParry = scr_MKSS_Player_CheckUpgrade(playerNum,"Base_Parry");
		
		if (hasParry)
		{
			var canParry = true;
			if (global.MKSS_CutsceneStopMovement) canParry = false;
			
			if ((canParry) and (parryCooldownTimer == -1) and ((input_check_pressed("LT",playerNum)) or (input_check_pressed("RT",playerNum))) and (!isAttacking))
			{
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Parry_Step);
				
				parryCooldownTimer = parryCooldownTimerMax;
				movespeed = 0;
			}
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
		#endregion
		
		#region Fall Roll
		scr_MKSS_Player_Component_FallRoll_Step(spriteSet.sprRoll);
		#endregion
		
		#region Animation
		if (!hasAttackAnimation)
		{
			if (hurtState == hurtStates.hurt)
			{
				if (ds_list_find_index(MKSS_HurtElement,global.AttackTypeIDs[? "electric"]) != -1)
				{
					sprite_index = spriteSet.sprHurtShocked;
				}
				else if (ds_list_find_index(MKSS_HurtElement,global.AttackTypeIDs[? "fire"]) != -1)
				{
					sprite_index = spriteSet.sprHurtBurned;
				}
				else if (ds_list_find_index(MKSS_HurtElement,global.AttackTypeIDs[? "ice"]) != -1)
				{
					sprite_index = spriteSet.sprHurtFrozen;
				}
				else
				{
					sprite_index = spriteSet.sprHurtNormal;
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