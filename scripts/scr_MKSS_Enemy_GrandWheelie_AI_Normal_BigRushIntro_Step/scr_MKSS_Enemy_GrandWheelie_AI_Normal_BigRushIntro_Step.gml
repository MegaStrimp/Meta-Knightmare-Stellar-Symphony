///@description MKSS - Enemy - Grand Wheelie - AI - Normal - Big Rush Intro - Step

function scr_MKSS_Enemy_GrandWheelie_AI_Normal_BigRushIntro_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Animation
		if ((hurtTimer == -1) and (hp > 0))
		{
			sprite_index = spriteSet.sprIdle;
		}
		#endregion
	}
}