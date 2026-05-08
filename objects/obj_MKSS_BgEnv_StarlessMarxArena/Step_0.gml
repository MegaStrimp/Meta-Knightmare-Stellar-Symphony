///@description Main

if (!localPause)
{
	if(secondphase){
		bgVDir = -1;
	}
	
	bgX -= bgSp;
	bgY += bgSp*bgVDir;

	if(bgX <= 512){
		bgX+=512;
	}if(bgY <= -512){
		bgY+=512;
	}if(bgY >= 512){
		bgY-=512;
	}
	
	//if(keyboard_check(ord("L"))){
	palIndex += .1;
	//}
	if (palIndex >= sprite_get_width(sprBGPal)-.1) palIndex -= sprite_get_width(sprBGPal);
	
	image_speed = 1;
	
	stars1X = (stars1X + stars1Spd + starsWidth) % starsWidth;
	stars2X = (stars2X + stars2Spd + starsWidth) % starsWidth;
	stars3X = (stars3X + stars3Spd + starsWidth) % starsWidth;
}
else
{
	image_speed = 0;
}