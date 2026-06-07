///@description MKSS - UI - Notif - Init - Set

function scr_MKSS_UI_Notif_Init_Set()
{
	#region Setup
	global.MKSS_NotifList = [];
	global.MKSS_NotifIDs = ds_map_create();
	#endregion
	
	#region Add Notifs Here
	#region Back To Halberd
	var notifUnlockMethod = function()
	{
		return true;
	};
	
	var text = ["Are you sure you want to go back to Battleship Halberd?\n\nUnsaved progress will be lost"];
	
	var notifNextScript = function()
	{
		scr_PlaySfx(snd_MKSS_ButtonNo);
		
		var targetRoom = rm_MKSS_BattleshipHalberd;
		scr_GoToRoom(targetRoom,false);
		
		scr_MKSS_Stage_End();
		
		with (obj_FrameworkControl)
		{
			MKSS_GamePause_TitleXTarget = -70;
			
			MKSS_GamePause_DecalLengthTarget = -50;
			MKSS_GamePause_Upgrades_ButtonYTarget = -40;
			MKSS_GamePause_SettingsButtonYTarget = -40;
			MKSS_GamePause_ExitButtonYTarget = -40;
			MKSS_GamePause_ReturnButtonYTarget = -40;
			
			MKSS_GamePause_DecalStarTimer = -1;
			
			MKSS_GamePause_EndTimer = 30;
		}
	};
	
	var notifBackScript = function()
	{
		scr_PlaySfx(snd_MKSS_ButtonChange);
		
		isClosed = true;
		destroyTimer = destroyTimerMax;
	};
	
	scr_MKSS_UI_Notif_Init_Add("backToHalberd",text,notifUnlockMethod,false);
	scr_MKSS_UI_Notif_Init_Add_Prompts("backToHalberd","Exit",notifNextScript,"Back",notifBackScript);
	#endregion
	
	#region Back To Title
	var notifUnlockMethod = function()
	{
		return true;
	};
	
	var text = ["Are you sure you want to go back to the Title Screen?\n\nUnsaved progress will be lost"];
	
	var notifNextScript = function()
	{
		scr_PlaySfx(snd_MKSS_ButtonNo);
		
		var targetRoom = rm_MKSS_Menu_TitleScreen;
		scr_GoToRoom(targetRoom,false);
		
		scr_MKSS_Stage_End();
		
		with (obj_FrameworkControl)
		{
			MKSS_GamePause_TitleXTarget = -70;
			
			MKSS_GamePause_DecalLengthTarget = -50;
			MKSS_GamePause_Upgrades_ButtonYTarget = -40;
			MKSS_GamePause_SettingsButtonYTarget = -40;
			MKSS_GamePause_ExitButtonYTarget = -40;
			MKSS_GamePause_ReturnButtonYTarget = -40;
			
			MKSS_GamePause_DecalStarTimer = -1;
			
			MKSS_GamePause_EndTimer = 30;
		}
	};
	
	var notifBackScript = function()
	{
		scr_PlaySfx(snd_MKSS_ButtonChange);
		
		isClosed = true;
		destroyTimer = destroyTimerMax;
	};
	
	scr_MKSS_UI_Notif_Init_Add("backToTitle",text,notifUnlockMethod,false);
	scr_MKSS_UI_Notif_Init_Add_Prompts("backToTitle","Exit",notifNextScript,"Back",notifBackScript);
	#endregion
	#endregion
}