///@description Draw

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);

var circleRadiusWave = sine_wave(current_time / 2000,2,.1,0);
var circleRadiusFinal = min(1,circleRadius + circleRadiusWave);
#endregion

#region Bg Portal
if (isActive)
{
	var circleRadiusBg = circleRadiusFinal + .1 + random_range(-.1,.1);
	draw_sprite_ext(spr_MKSS_StageEntrance_Portal_Base_Afterimage,circleIndex,x,y - 36,circleRadiusBg,circleRadiusBg,circleAngleWave,c_gray,.5);
}
#endregion

scr_DrawMask_Begin();

scr_DrawMask_Mask(spr_MKSS_StageEntrance_Portal_Base_Mask,circleIndex,,y - 36,circleRadiusFinal,circleRadiusFinal,circleAngleWave);

#region Icon
var targetIcon = global.MKSS_StageList[selection].icon;

if (targetIcon != undefined) draw_sprite(targetIcon,0,x,y - 4);
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

#region Portal
draw_sprite_ext(spr_MKSS_StageEntrance_Portal_Base,circleIndex,x,y - 36,circleRadiusFinal,circleRadiusFinal,circleAngleWave,c_white,1);
#endregion