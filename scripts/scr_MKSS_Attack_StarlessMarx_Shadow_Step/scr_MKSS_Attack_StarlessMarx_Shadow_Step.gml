function scr_MKSS_Attack_StarlessMarx_Shadow_Step()
{
	if (!localPause)
	{
		textureX = (textureX + 1) % textureWidth;
		textureY = (textureY + 3) % textureHeight;
	}
}