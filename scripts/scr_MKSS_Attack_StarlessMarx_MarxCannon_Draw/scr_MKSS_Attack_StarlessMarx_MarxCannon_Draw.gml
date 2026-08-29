///@description MKSS - Attack - Starless Marx - Marx Cannon - Draw

function scr_MKSS_Attack_StarlessMarx_MarxCannon_Draw()
{
	draw_line_width(owner.x+(24*owner.dirX),owner.y,owner.x+(24*owner.dirX)+(laserWidth*owner.dirX),owner.y,laserHeight+(laserHeightOffset*laserHeightOffsetAmount));
}