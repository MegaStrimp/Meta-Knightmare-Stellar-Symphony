///@description MKSS - Attack - Starless Marx - Marx Cannon - Draw

function scr_MKSS_Attack_StarlessMarx_MarxCannon_Draw()
{
	draw_line_width(owner.x + (24 * owner.dirX),owner.y,owner.x + (24 * owner.dirX) + (laserWidth * owner.dirX),owner.y,laserHeight + (laserHeightOffset * laserHeightOffsetAmount));
	
	if (parried)
	{
		var _x = -64;
		if (owner.dirX == 1) _x = room_width + 64;
		var _y = (laserHeight / 3) - 4;
		var _randomOffset = 24;
		
		draw_line_width(owner.x + (24 * owner.dirX) + (laserWidth * owner.dirX) - (8 * owner.dirX),owner.y - (laserHeightOffset * (laserHeightOffsetAmount * .5)),_x,owner.y - (laserHeightOffset * (laserHeightOffsetAmount * .5)) - 40 + irandom_range(0,_randomOffset/2),(laserHeight / 5));
		draw_line_width(owner.x + (24 * owner.dirX) + (laserWidth * owner.dirX) - (8 * owner.dirX),owner.y + (laserHeightOffset * (laserHeightOffsetAmount * .5)),_x,owner.y + (laserHeightOffset * (laserHeightOffsetAmount * .5)) + 40 - irandom_range(0,_randomOffset/2),(laserHeight / 5));
		
		draw_line_width(owner.x + (24 * owner.dirX) + (laserWidth * owner.dirX) - (8 * owner.dirX),owner.y - _y - (laserHeightOffset * (laserHeightOffsetAmount * .5)),_x,owner.y - _y - (laserHeightOffset * (laserHeightOffsetAmount * .5)) - 88 + irandom_range(0,_randomOffset),(laserHeight / 2.5));
		draw_line_width(owner.x + (24 * owner.dirX) + (laserWidth * owner.dirX) - (8 * owner.dirX),owner.y + _y + (laserHeightOffset * (laserHeightOffsetAmount * .5)),_x,owner.y + _y + (laserHeightOffset * (laserHeightOffsetAmount * .5)) + 88 - irandom_range(0,_randomOffset),(laserHeight / 2.5));
	}
}