///@description Begin Step

#region Variables
speedMultFinal = global.speedMultGlobal * global.speedMultPlayer * speedMult * global.deltaTime;
localPause = global.pauseFinal;
#endregion

#region Character Setup
if (characterSetup)
{
	switch (pointSize)
	{
		case 0:
		sprite_index = spr_MKSS_MetaPoint1;
		break;
		
		case 1:
		sprite_index = spr_MKSS_MetaPoint2;
		break;
		
		case 2:
		sprite_index = spr_MKSS_MetaPoint3;
		break;
	}
	
	characterSetup = false;
}
#endregion