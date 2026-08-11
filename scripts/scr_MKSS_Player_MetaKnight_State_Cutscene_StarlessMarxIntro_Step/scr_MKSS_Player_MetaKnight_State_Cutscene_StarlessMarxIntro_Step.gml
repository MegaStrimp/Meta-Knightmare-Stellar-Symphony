///@description MKSS - Player - Meta Knight - State - Cutscene - StarlessMarxIntro - Step

function scr_MKSS_Player_MetaKnight_State_Cutscene_StarlessMarxIntro_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		lookingForward = false;
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		scr_MKSS_Player_Component_Movement();
		#endregion
		
		#region Gravity
		scr_MKSS_Player_Component_Gravity();
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
						if (lookingForward)
						{
							sprite_index = spriteSet.sprFront;
						}
						else
						{
							sprite_index = spriteSet.sprIdle;
						}
					}
				}
				else
				{
					var sprAirFinal = sprite_index;
					
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
					
					sprite_index = sprAirFinal;
				}
			}
		}
		#endregion
		
		#region Fall Duck
		scr_MKSS_Player_Component_FallDuck_Step(spriteSet.sprDuck);
		#endregion
		
		#region Fall Hop
		scr_MKSS_Player_Component_FallHop_Step(spriteSet.sprFallHop);
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}