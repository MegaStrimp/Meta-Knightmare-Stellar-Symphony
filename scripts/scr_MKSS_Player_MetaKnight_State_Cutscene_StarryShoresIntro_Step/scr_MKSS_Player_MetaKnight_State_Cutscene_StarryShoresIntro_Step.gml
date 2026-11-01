///@description MKSS - Player - Meta Knight - Cutscene - Starry Shores Intro - Step

function scr_MKSS_Player_MetaKnight_State_Cutscene_StarryShoresIntro_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Animation
		sprite_index = spriteSet.sprFallen;
		#endregion
	}
}