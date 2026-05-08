///@description Draw

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);

circleX = xx + global.gameWidth / 2;
circleY = yy + global.gameHeight / 2;
#endregion

#region Background
if (!surface_exists(drawSurface))
{
	if (surface_exists(drawSurface)) surface_free(drawSurface);
	drawSurface = surface_create(global.gameWidth,global.gameHeight);
}

surface_set_target(drawSurface);
draw_clear_alpha(c_black,0);

draw_sprite(spr_MKSS_UI_StageClear_Bg,0,0,0);

var starWidth = 600;
var starHeight = 400;

for (var i = 0; i < 2; i++)
{
	for (var h = 0; h < 2; h++)
	{
		draw_sprite(spr_MKSS_UI_StageClear_Bg_Stars1,0,0 - (starWidth * i) + ((current_time / (60 * 5)) % starWidth),0 + (starHeight * h) - ((current_time / (10 * 5)) % starHeight));
		draw_sprite(spr_MKSS_UI_StageClear_Bg_Stars2,0,0 - (starWidth * i) + ((current_time / (60 * 4)) % starWidth),0 + (starHeight * h) - ((current_time / (10 * 4)) % starHeight));
		draw_sprite(spr_MKSS_UI_StageClear_Bg_Stars3,0,0 - (starWidth * i) + ((current_time / (60 * 3)) % starWidth),0 + (starHeight * h) - ((current_time / (10 * 3)) % starHeight));
		draw_sprite(spr_MKSS_UI_StageClear_Bg_Stars4,0,0 - (starWidth * i) + ((current_time / (60 * 2)) % starWidth),0 + (starHeight * h) - ((current_time / (10 * 2)) % starHeight));
		draw_sprite(spr_MKSS_UI_StageClear_Bg_Stars5,0,0 - (starWidth * i) + ((current_time / (60)) % starWidth),0 + (starHeight * h) - ((current_time / (10)) % starHeight));
	}
}

surface_reset_target();
#endregion

#region Circle
scr_DrawMask_Begin(,,,,1);

draw_set_alpha(0);
if (circleR > 0) draw_circle(circleX,circleY,circleR,false);
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);

gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
draw_set_alpha(1);

draw_surface(drawSurface,xx,yy);
//draw_rectangle_color(xx,yy,xx + global.gameWidth,yy + global.gameHeight,c_black,c_black,c_black,c_black,false);

if (circleR > 0)
{
	draw_circle_color(circleX,circleY,circleR + 3,c_white,c_white,false);
	draw_circle_color(circleX,circleY,circleR + 2,#73B3EA,#73B3EA,false);
	draw_circle_color(circleX,circleY,circleR + 1,#C4F5FF,#C4F5FF,false);
}

scr_DrawMask_End();

if (circleR > 0) draw_circle_color(circleX,circleY,circleR,#C4F5FF,#C4F5FF,true);
#endregion

#region Title
scribble("Level Complete").align(fa_center).draw(xx + (global.gameWidth / 2),yy + 4);
#endregion

#region Button Hints
var hubIcon = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("B"))];
if (targetIcon != undefined) hubIcon = "[" + sprite_get_name(targetIcon) + "]";

scribble(hubIcon + " Halberd").draw(xx + 4,yy + global.gameHeight - 16 + hintOffset + (2 * (buttonInputTimerComponent_BTimer != -1)));

var retryIcon = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("X"))];
if (targetIcon != undefined) retryIcon = "[" + sprite_get_name(targetIcon) + "]";

scribble(retryIcon + " Retry").align(fa_center).draw(xx + (global.gameWidth / 2),yy + global.gameHeight - 16 + hintOffset + (2 * (buttonInputTimerComponent_XTimer != -1)));

var nextIcon = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("A"))];
if (targetIcon != undefined) nextIcon = "[" + sprite_get_name(targetIcon) + "]";

var text = scribble(nextIcon + " Next");
text.draw(xx + global.gameWidth - 4 - text.get_width(),yy + global.gameHeight - 16 + hintOffset + (2 * (buttonInputTimerComponent_YTimer != -1)));
#endregion