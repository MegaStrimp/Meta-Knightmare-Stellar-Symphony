///@description MKSS - Attack - Meta Knight - Slide - Enemy Hit Behavior

function scr_MKSS_Attack_MetaKnight_Slide_EnemyHitBehavior()
{
	#region Variables
	var hasSharpSlide = scr_MKSS_Player_CheckUpgrade(playerNum,"Base_SharpSlide");
	#endregion
	
	#region Cancel Attack
	if (hasSharpSlide)
	{
		with (owner)
		{
			attackCooldownTarget = 15;
			
			hsp = -dirX * .4 * speedMultFinal;
			slideAccelTimer = -1;
			slideEndTimer = 0;
		}
	}
	#endregion
}