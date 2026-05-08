///@description Player - Meta Knight - State - Slide - Step

function scr_MKSS_Player_MetaKnight_State_Slide_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		#region Attack
		with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
		{
			owner = other;
			isEnemy = false;
			dmg = 2;
			followOwner = true;
			destroyIfOwnerNotAttack = true;
			canBreakBlocks = true;
			isMelee = true;
			freezeFrameForce = 1;
			knockbackAngle = 10;
			if (other.dirX == -1) knockbackAngle = 170;
			knockbackForce = 1.75;
			enemyHurtTimerMult = 2.5;
			mask_index = spr_MKSS_Attack_MetaKnight_Slide_Mask;
			image_xscale = other.dirX;
			dirX = other.dirX;
			attackAIBeginStep = scr_MKSS_Attack_MetaKnight_Slide_BeginStep;
			enemyHitBehavior = scr_MKSS_Attack_MetaKnight_Slide_EnemyHitBehavior;
			attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_Impact;
		}
		#endregion
		
		slideAccelTimer = floor(attackCancelTimer / 1.5);
		slideEndTimer = attackCancelTimer;
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		scr_MKSS_Player_Component_SlideMovement();
		#endregion
		
		#region Gravity
		scr_MKSS_Player_Component_DuckGravity();
		#endregion
		
		#region Slide Accel Timer
		if (slideAccelTimer != -1)
		{
			slideAccelTimer = max(slideAccelTimer - speedMultFinal,0);
			if (slideAccelTimer == 0)
			{
				slideAccelTimer = -1;
			}
		}
		#endregion
		
		#region Slide End Timer
		if (slideEndTimer != -1)
		{
			slideEndTimer = max(slideEndTimer - speedMultFinal,0);
			if (slideEndTimer == 0)
			{
				attackCancelTimer = 0;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Duck_Step);
				
				slideEndTimer = -1;
			}
		}
		#endregion
		
		#region Animation
		if (!hasAttackAnimation)
		{
			sprite_index = spriteSet.sprSlide;
			image_index = (slideAccelTimer == -1);
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}