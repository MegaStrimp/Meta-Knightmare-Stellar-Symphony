///@description MKSS - Settings - Component - Border Art - Draw

function scr_MKSS_Settings_Component_BorderArt_Draw(targetIndex)
{
	var font = "[fnt_Advance_Gray]";
	if (selection == i) font = "[fnt_Advance]";
	
	text = scribble(font + global.settingsList[selectionIndex].title + "\t" +  + string(global.MKSS_BorderArtList[global.MKSS_CurrentBorderArt].name) + "[/font]");
	text.draw(startX + 12,startY + (separation * i));
}