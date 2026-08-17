///@description Draw

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);

circleX = xx + global.gameWidth / 2;
circleY = yy + global.gameHeight / 2;
#endregion

#region Circle
scr_DrawMask_Begin(,,,,1);

draw_set_alpha(0);
if (circleR > 0) draw_circle(circleX,circleY,circleR,false);
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);

gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
draw_set_alpha(1);

draw_surface(obj_MKSS_Surface_Planetarium.drawSurface,xx,yy);
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

#region Text
scribble("Level Complete").align(fa_center).draw(xx + (global.gameWidth / 2),yy + 4);
#endregion

#region Stage Score
if (global.MKSS_StageHasScore)
{
	with (obj_FrameworkControl)
	{
		draw_sprite(hud_MedalSprite,hud_MedalIndex,xx + 24 - (other.hintOffset * 3),yy + 14);
		
		if (hud_MedalTier != -1)
		{
			scr_DrawMask_Begin();
			scr_DrawMask_Mask(hud_MedalSprite,hud_MedalIndex,xx + 24 - (other.hintOffset * 3),yy + 14);
				
			draw_sprite_ext(spr_MKSS_UI_Medal_Shine,0,xx + floor(200 - ((global.currentTimePausable * 2) % 200)) - (other.hintOffset * 3),yy + 14,1,1,0,c_white,.5);
				
			scr_DrawMask_End();
		}
		
		for (var i = 0; i < max(0,hud_MedalTier); i++)
		{
			draw_sprite(spr_MKSS_Particle_SmallSparkle,hud_MedalSparkleIndex,floor(12 + hud_MedalSparkleX[i]),floor(26 - hud_MedalSparkleY[i]));
		}
		
		var displayedScore = string_replace_all(string_format(global.levelScoreCurrent,6,0)," ","0");
		scribble(hud_MedalFont + string(displayedScore) + "[/font]").align(fa_center).draw(xx + 24 - (other.hintOffset * 3),yy + 28);
	}
}
#endregion

#region Meta Points
with (obj_FrameworkControl)
{
	var textCol = "#FFFFFF";
	var iconCol = #FFFFFF;
	if (metaPointCollectTimer != -1)
	{
		textCol = "#B2FFFF";
		iconCol = #B2FFFF;
	}
	
	draw_sprite_ext(spr_MKSS_Hud_MetaPoints_Icon,0,xx + 2 - (other.hintOffset * 3),yy + 38 - (metaPointCollectTimer != -1),1,1,0,iconCol,1);
	
	var displayedPoints = string_replace_all(string_format(hud_DisplayedMetaPoints,4,0)," ","0");
	scribble("[fnt_Advance_Small][" + string(textCol) + "]x[fnt_Advance]" + string(displayedPoints) + "[/font][/color]").draw(xx + 14 - (other.hintOffset * 3),yy + 44);
}
#endregion

#region Collectibles
with (obj_FrameworkControl)
{
	if (global.currentStage != -1)
	{
		var collectibleList = global.MKSS_StageList[global.MKSS_StageIDs[? global.currentStage]].collectibles;
		var collectibleCount = array_length(collectibleList);
			
		if (collectibleCount != 0)
		{
			draw_sprite_ext(spr_MKSS_Hud_Collectibles_Bg,0,xx + global.gameWidth + (other.hintOffset * 3),yy + 2,1,1,0,c_white,.5);
				
			for (var i = 0; i < array_length(collectibleList); i++)
			{
				collectibleCount -= 1;
					
				if (collectibleList[i].icon != undefined)
				{
					var waveX = sine_wave(current_time / 4200,1,1,0);
					var waveY = sine_wave(current_time / (4500 + (4500 * i)),.8,1.1,0);
						
					if (!collectibleList[i].isObtained) gpu_set_fog(true,c_black,0,0);
					draw_sprite(collectibleList[i].icon,0,xx + global.gameWidth - 12 - (22 * collectibleCount) + floor(waveX) + (other.hintOffset * 3),yy + 14 - (2 * collectibleCount) + floor(waveY));
					if (!collectibleList[i].isObtained) gpu_set_fog(false,c_white,0,0);
				}
			}
		}
	}
}
#endregion

#region Button Hints
var hubIcon = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("B"))];
if (targetIcon != undefined) hubIcon = "[" + sprite_get_name(targetIcon) + "]";

scribble(hubIcon + " Halberd").draw(xx + 4,yy + global.gameHeight - 16 + hintOffset + (2 * (buttonInputTimerComponent_BTimer != -1)));

if (targetRoom_Retry != -1)
{
	var retryIcon = "";
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("X"))];
	if (targetIcon != undefined) retryIcon = "[" + sprite_get_name(targetIcon) + "]";
	
	scribble(retryIcon + " Retry").align(fa_center).draw(xx + (global.gameWidth / 2),yy + global.gameHeight - 16 + hintOffset + (2 * (buttonInputTimerComponent_XTimer != -1)));
}

if (targetRoom_Next != -1)
{
	var nextIcon = "";
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("A"))];
	if (targetIcon != undefined) nextIcon = "[" + sprite_get_name(targetIcon) + "]";
	
	var text = scribble(nextIcon + " Next");
	text.draw(xx + global.gameWidth - 4 - text.get_width(),yy + global.gameHeight - 16 + hintOffset + (2 * (buttonInputTimerComponent_YTimer != -1)));
}
#endregion