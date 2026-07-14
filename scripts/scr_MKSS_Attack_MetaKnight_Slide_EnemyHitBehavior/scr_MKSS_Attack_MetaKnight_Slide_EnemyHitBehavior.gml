///@description MKSS - Attack - Meta Knight - Slide - Enemy Hit Behavior

function scr_MKSS_Attack_MetaKnight_Slide_EnemyHitBehavior()
{
	#region Variables
	var canPierce = ((scr_MKSS_Player_CheckUpgrade(owner.playerNum,"Base_SharpSlide")) and (input_check("A",owner.playerNum)));
	#endregion
	
	#region Cancel Attack
	if (!canPierce)
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