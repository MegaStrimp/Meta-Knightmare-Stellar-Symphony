///@description MKSS - Enemy - Andromeda 1 - AI - Normal - Stun - Step

function scr_MKSS_Enemy_Andromeda1_AI_Normal_Stun_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		stunCancelTimer = 300;
		
		sprite_index = spriteSet.sprIdle;
		image_index = 0;
		
		arm = [false,false,false,false];
		armRB.depth = armRB.depthDefault;
		armLB.depth = armLB.depthDefault;
		armRT.depth = armRT.depthDefault;
		armLT.depth = armLT.depthDefault;
		armRB.image_alpha = 1;
		armLB.image_alpha = 1;
		armRT.image_alpha = 1;
		armLT.image_alpha = 1;
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Friction
		var decelFinal = decelStun * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		#endregion
		
		#region Flash Timer
		if (flashTimer == -1) flashTimer = flashTimerTarget;
		#endregion
		
		#region Revert Back
		if (stunCancelTimer == -1)
		{
			canHaveKnockback = false;
			hasKnockback = false;
			defense = prevDefense;
			//knockbackResistance = prevKnockbackResistance;
			flashTimer = -1;
			palIndex = 1;
			
			sprite_index = spriteSet.sprIdle;
			image_index = 0;
			
			scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
		}
		#endregion
		
		//#region Gravity
		//vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		//#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
		
		//#region Animation
		//sprite_index = sprHurt[hurtFrame][0];
		
		//if (stunCancelTimer <= 60) shakeX = 2;
		//#endregion
	}
}