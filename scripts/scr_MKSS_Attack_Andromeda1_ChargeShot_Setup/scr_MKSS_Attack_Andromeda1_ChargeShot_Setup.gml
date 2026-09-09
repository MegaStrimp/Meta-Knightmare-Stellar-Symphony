///@description MKSS - Attack - Andromeda 1 - Charge Shot - Setup

function scr_MKSS_Attack_Andromeda1_ChargeShot_Setup()
{
	hsp = 0;
	vsp = 0;
	
	spd = -3;
	angle = 0;
	
	accel = .3;
	spdMax = 8;
	
	shot = false;
	
	scaleMax = 1;
	scaleGain = 1 / 50;
	scale = scaleGain;
	image_xscale = scale;
	image_yscale = scale;
	
	textureSprite = bg_MKSS_AdAstra;
	textureWidth = sprite_get_width(textureSprite);
	textureHeight = sprite_get_height(textureSprite);
	textureX = irandom_range(0,textureWidth);
	textureY = irandom_range(0,textureHeight);
	textureSpd = 3;
	
	attackAIStep = scr_MKSS_Attack_Andromeda1_ChargeShot_Step;
	attackDraw = scr_MKSS_Attack_Andromeda1_ChargeShot_Draw;
}