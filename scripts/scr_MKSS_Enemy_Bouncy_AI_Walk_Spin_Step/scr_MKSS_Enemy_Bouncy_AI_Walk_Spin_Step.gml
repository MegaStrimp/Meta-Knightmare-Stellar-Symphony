///@description MKSS - Enemy - Bouncy - AI - Walk - Spin - Step

function scr_MKSS_Enemy_Bouncy_AI_Walk_Spin_Step()
{
	if (!localPause)
	{
		#region Movement
		if (!grounded) scr_Component_BasicHorizontal_Step(true);
		#endregion
		
		#region Grounded
		if (grounded)
		{
			var parAngle = irandom_range(0,359);
			var parScaleDir = 1;
			if ((parAngle > 90) and (parAngle <= 270))
			{
				parScaleDir = -1;
			}
			
			scr_MKSS_ParticleSet_FallDuck(x,y,parScaleDir,parAngle);
					
			hsp = 0;
			image_index = 0;
			
			dirX = scr_MKSS_Enemy_DirTarget();
			
			scr_Component_BasicHorizontal_Setup(movespeedNormal);
			scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
		}
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
		sprite_index = spriteSet.sprSpinJump;
		#endregion
	}
}