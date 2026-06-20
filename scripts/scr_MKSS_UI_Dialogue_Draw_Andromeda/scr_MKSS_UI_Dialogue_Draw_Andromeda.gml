///@description MKSS - UI - Dialogue - Draw - Andromeda

function scr_MKSS_UI_Dialogue_Draw_Andromeda()
{
	#region Variables
	var xx = camera_get_view_x(mainView);
	var yy = camera_get_view_y(mainView);
	
	var backgroundWidth = sprite_get_width(spr_MKSS_Dialogue_Andromeda_Background);
	#endregion
	
	#region Background
	var xOffset = (floor(global.currentTimePausable / 5) + backgroundWidth) % backgroundWidth;
	draw_sprite(spr_MKSS_Dialogue_Andromeda_Background,0,xx - xOffset,yy);
	draw_sprite(spr_MKSS_Dialogue_Andromeda_Background,0,xx - xOffset + backgroundWidth,yy);
	#endregion
	
	#region Portrait
	if (currentPortrait != undefined)
	{
		var finalImageIndex = 0;
		if ((currentPortrait != portrait_Talk) or (portrait_Idle == portrait_Talk)) finalImageIndex = portraitImageIndex;
		
		draw_sprite(currentPortrait,finalImageIndex,xx,yy);
	}
	#endregion
	
	#region Text
	if (text != undefined)
	{
		scribble(text).wrap(180).draw(xx + 60,yy + 4,typist);
	}
	#endregion
	
	#region Button Hints
	if (!dialogueIsFlowing)
	{
		var targetIcon = global.UI_IconBindings[? string(input_binding_get("A"))];
		if (targetIcon != undefined) draw_sprite(targetIcon,0,xx + 227,yy + 34 + (2 * (buttonInputTimerComponent_YTimer != -1)));
	}
	#endregion
}