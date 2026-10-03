///@description MKSS - Enemy - Sparky - AI - Walk and Attack - Spark - Step

function scr_MKSS_Enemy_Sparky_AI_WalkAndAttack_Spark_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Variables
		attackString = "Sparky - Spark";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		#endregion
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		if (!grounded) scr_Component_BasicHorizontal_Step(true);
		#endregion
		
		#region Revert If Hurt
		if (hasKnockback)
		{
			scr_Component_BasicHorizontal_Setup(movespeedNormal);
			scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
			
			attackIndex = -1;
		}
		#endregion
		
		#region Gravity
		vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Friction
		if (grounded)
		{
			var decelFinal = decel * speedMultFinal;
			
			hsp = scr_Entity_Friction(hsp,decelFinal);
		}
		#endregion
			
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Animation
		sprite_index = spriteSet.sprAttackReady;
		#endregion
	}
}