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
		points = 1;
		break;
		
		case 1:
		sprite_index = spr_MKSS_MetaPoint2;
		points = 5;
		break;
		
		case 2:
		sprite_index = spr_MKSS_MetaPoint3;
		points = 20;
		break;
	}
	
	characterSetup = false;
}
#endregion