///@description MKSS - Attack - Andromeda1 - Star Slash - Setup

function scr_MKSS_Attack_Andromeda1_StarSlash_Setup()
{
	textureSprite = bg_MKSS_AdAstra;
	textureWidth = sprite_get_width(textureSprite);
	textureHeight = sprite_get_height(textureSprite);
	textureX = irandom_range(0,textureWidth);
	textureY = irandom_range(0,textureHeight);
	textureSpd = 3;
	
	indicatorWidthMax = 6;
	indicatorWidth = 0;
	indicatorWidthGain = indicatorWidthMax/10;
	
	slashWidthMax = 20;
	slashWidth = 0;
	slashWidthGain = slashWidthMax/8;
	slashDir = 1;
	
	gashWidthMax = 20;
	gashWidth = 0;
	gashWidthGain = gashWidthMax/8;
	gashEndTimer = 120;
	
	slashState = 0;
	slashAngle = irandom_range(-16,16);
	
	pauseOutsideView = false;
	destroyOutsideRoom = false;
	
	attackDraw = scr_MKSS_Attack_Andromeda1_StarSlash_Draw;
	attackAIStep = scr_MKSS_Attack_Andromeda1_StarSlash_Step;
}