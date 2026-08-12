///@description MKSS - Attack - Chasse Emee - Big Cannonball - Setup

function scr_MKSS_Attack_ChasseEmee_BigCannonball_Setup()
{
	shadowY = 0;
	var _pos = 32;
	while (!shadowY)
	{
		_pos++;
		
		if (position_meeting(x,_pos,obj_Wall)) or (_pos >= room_height) shadowY = _pos;
	}
	
	shadowScale = 0;
	shadowScaleMin = 0;//8;
	shadowScaleMax = 24;
	
	attackAIStep = scr_MKSS_Attack_ChasseEmee_BigCannonball_Step;
	attackDraw = scr_MKSS_Attack_ChasseEmee_BigCannonball_Draw;
}