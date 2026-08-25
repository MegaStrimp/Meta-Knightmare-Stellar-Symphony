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
		if (!place_meeting(x,y - 1,obj_Wall))
		{
			if (currentAbility != -1)
			{
				script_execute(global.MKSS_WeaponList[currentAbility].baseScript);
			}
		}
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