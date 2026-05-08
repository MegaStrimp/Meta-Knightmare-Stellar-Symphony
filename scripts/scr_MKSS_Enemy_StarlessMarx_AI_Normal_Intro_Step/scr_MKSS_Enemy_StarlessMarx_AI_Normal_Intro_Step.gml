///@description MKSS - Enemy - Starless Marx - AI - Normal - Intro - Step

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_Intro_Step()
{
	if (!localPause)
	{
		#region Float
		drawYOffset = sine_between((global.currentTimePausable / 10),4,-2,2);
		#endregion
		
		#region Animation
		sprite_index = spriteSet.sprIntro;
		#endregion
	}
}