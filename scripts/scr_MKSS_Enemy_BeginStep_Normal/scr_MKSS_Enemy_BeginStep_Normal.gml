///@description MKSS - Enemy - Begin Step - Normal

function scr_MKSS_Enemy_BeginStep_Normal()
{
	#region Healthbar Setup
	if (hpHealthbar == -1)
	{
		if (!isBoss)
		{
			hpHealthbar = hp;
			hpHealthbarMiddle = hp;
		}
	}
	#endregion
	
	#region Shadow
	shadowAlphaTarget = 0;
	
	if (position_meeting(x,y,obj_MKSS_ShadowArea)) shadowAlphaTarget = 1;
	
	shadowAlpha = lerp(shadowAlpha,shadowAlphaTarget,.1);
	
	if (shadowAlpha < 1) shadowAlphaFinal = .66;
	if (shadowAlpha < .66) shadowAlphaFinal = .33;
	if (shadowAlpha < .33) shadowAlphaFinal = 0;
	#endregion
}