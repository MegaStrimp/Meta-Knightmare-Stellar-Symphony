///@description MKSS - Attack - Andromeda1 - Arm - Setup

function scr_MKSS_Attack_Andromeda1_Arm_Setup()
{
	hsp = 0;
	vsp = 0;
	
	pauseOutsideView = false;
	destroyOutsideRoom = false;
	
	attackDraw = scr_MKSS_Attack_Andromeda1_Arm_Draw;
	attackAIStep = scr_MKSS_Attack_Andromeda1_Arm_Step;
}