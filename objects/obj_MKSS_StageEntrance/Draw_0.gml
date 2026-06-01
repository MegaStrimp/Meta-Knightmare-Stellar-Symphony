///@description Draw

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
#endregion

scr_DrawMask_Begin();

draw_set_alpha(1);

var waveX = sine_wave(current_time / 4200,1,1,0);
var waveY = sine_wave(current_time / 4500,.8,1.1,0);

draw_circle(x + waveX,y - 36 + waveY,circleRadius,false);

gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);

gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
gpu_set_alphatestenable(true);
draw_set_alpha(1);

#region Icon
var targetIcon = global.MKSS_StageList[selection].icon;

if (targetIcon != undefined) draw_sprite(targetIcon,0,x,y - 4);
#endregion

#region Gems
var collectibleList = global.MKSS_StageList[selection].collectibles;

for (var i = 0; i < array_length(collectibleList); i++)
{
	if (collectibleList[i].icon != undefined)
	{
		var waveX = sine_wave(current_time / 4200,1,1,0);
		var waveY = sine_wave(current_time / (4500 + (4500 * i)),.8,1.1,0);
		
		if (!collectibleList[i].isObtained) gpu_set_fog(true,c_black,0,0);
		gpu_set_fog(false,c_white,0,0);
		if (!collectibleList[i].isObtained) draw_sprite(collectibleList[i].icon,0,x + 14 + (18 * i) + waveX,y - 5 - (2 * i) + waveY);
	}
}
#endregion

scr_DrawMask_End();

#region Stage Score
if (isActive)
{
	var stageScore = global.MKSS_StageList[selection].earnedHighScore;
	
	switch (global.MKSS_StageList[selection].earnedMedal)
	{
		case -1:
		var medalSprite = spr_MKSS_UI_Medal_None;
		var stageScoreFont = "[fnt_Advance_Gray]";
		break;
		
		case 0:
		var medalSprite = spr_MKSS_UI_Medal_Bronze;
		var stageScoreFont = "[fnt_Advance]"; //STRIMPTODO
		break;
		
		case 1:
		var medalSprite = spr_MKSS_UI_Medal_Silver;
		var stageScoreFont = "[fnt_Advance]";
		break;
		
		case 2:
		var medalSprite = spr_MKSS_UI_Medal_Gold;
		var stageScoreFont = "[fnt_Advance]";
		break;
		
		case 3:
		var medalSprite = spr_MKSS_UI_Medal_Platinum;
		var stageScoreFont = "[fnt_Advance]";
		break;
	}
	
	draw_sprite(medalSprite,0,xx + 16,yy + 36);
	
	var displayedScore = string_replace_all(string_format(stageScore,6,0)," ","0");
	scribble(stageScoreFont + string(displayedScore) + "[/font]").align(fa_center).draw(xx + 52,yy + 32);
}
#endregion