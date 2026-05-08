///@description MKSS - Stage - Clear

function scr_MKSS_Stage_Clear()
{
	global.hasHud = false;
	
	scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "stageClear"]);
	
	with (obj_MKSS_UI_FadingText) instance_destroy();
	
	with (obj_Player)
	{
		scr_Player_CancelAttack(id,attackIndex);
		
		scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_StageClear_Step);
	}
	
	var xx = camera_get_view_x(mainView) + (global.gameWidth / 2);
	var yy = camera_get_view_y(mainView) + (global.gameHeight / 2);
	
	with (instance_create_layer(xx,yy,"Player",obj_MKSS_UI_StageClear))
	{
		scr_Camera_FollowObject(id);
	}
	
}