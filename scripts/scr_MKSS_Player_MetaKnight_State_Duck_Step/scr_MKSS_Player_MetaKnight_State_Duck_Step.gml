///@description Player - Meta Knight - State - Duck - Step

function scr_MKSS_Player_MetaKnight_State_Duck_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		isDucking = true;
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		scr_MKSS_Player_Component_DuckMovement();
		#endregion
		
		#region Gravity
		scr_MKSS_Player_Component_DuckGravity();
		#endregion
		
		#region Slide
		if ((!isAttacking) and (attackCooldown == -1))
		{
			if (input_check_pressed("A",playerNum))
			{
				attackIndex = global.MKSS_AttackIDs[? "metaKnight_Slide"];
				
				script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
			}
		}
		#endregion
		
		#region Attack
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
					if (((attackIndex == MKSS_PlayerAttacks.galaxia_Slice1) or ((attackIndexPrevious == MKSS_PlayerAttacks.galaxia_Slice1) and (attackCooldown != -1))) and (attackCancelTimer <= 25))
					{
						scr_MKSS_Attack_Execute_Player_Galaxia_Slash2();
					}
					#endregion
					
					if (!isAttacking)
					{
						#region Slash 1
						if (attackCooldown == -1)
						{
							scr_MKSS_Attack_Execute_Player_Galaxia_Slash1();
						}
						#endregion
					}
				}
				
				if (input_check_pressed("B",playerNum))
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
		
		#region Go Back
		scr_MKSS_Player_Component_DuckGoBack(scr_MKSS_Player_MetaKnight_State_Normal_Step);
		#endregion
		
		#region Animation
		if (!hasAttackAnimation)
		{
			sprite_index = spriteSet.sprDuck;
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}