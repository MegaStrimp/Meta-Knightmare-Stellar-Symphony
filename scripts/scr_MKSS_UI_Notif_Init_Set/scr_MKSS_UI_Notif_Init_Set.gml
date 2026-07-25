///@description MKSS - UI - Notif - Init - Set

function scr_MKSS_UI_Notif_Init_Set()
{
	#region Setup
	global.MKSS_NotifList = [];
	global.MKSS_NotifIDs = ds_map_create();
	#endregion
	
	#region Add Notifs Here
	#region Special Bar Tutorial
	var notifUnlockMethod = function()
	{
		return true;
	};
	
	var text = ["You filled your Special Bar!",
	"Every sword has a unique Special Action you can execute by filling the bar and pressing [YIcon]",
	"Some may be better depending on the situation. Try them all!"];
	
	var image = [spr_MKSS_UI_NotifBox_Image_SpecialBarTutorial,
	spr_MKSS_UI_NotifBox_Image_SpecialBarTutorial,
	spr_MKSS_UI_NotifBox_Image_SpecialBarTutorial];
	
	scr_MKSS_UI_Notif_Init_Add("specialBarTutorial",text,notifUnlockMethod,true,image);
	#endregion
	
	#region Concentrated Gem Tutorial
	var notifUnlockMethod = function()
	{
		return true;
	};
	
	var text = ["You can find Blue and Red Concentrated Gems on each stage. They are made from pure [" + MKSS_Base_Color_Andromeda + "]Stellar Delusions[/color].",
	"Blue Gems unlock Enemy Ordeals, where you can take on harder waves of enemies to earn Stage-based Sprays!",
	"While Red Gems unlock Starless Bosses, stellar manifestations of the most vicious foes Meta Knight has ever faced!",
	"Defeat them for a Spray based on their original forms!",
	"The Bonus Stages are accessible from Battleship Halberd. Good luck!"];
	
	var image = [spr_MKSS_UI_NotifBox_Image_ConcentratedGem1,
	spr_MKSS_UI_NotifBox_Image_ConcentratedGem2,
	spr_MKSS_UI_NotifBox_Image_ConcentratedGem2,
	spr_MKSS_UI_NotifBox_Image_ConcentratedGem2,
	spr_MKSS_UI_NotifBox_Image_ConcentratedGem2];
	
	scr_MKSS_UI_Notif_Init_Add("concentratedGemTutorial",text,notifUnlockMethod,true,image);
	#endregion
	
	#region Back To Halberd
	var notifUnlockMethod = function()
	{
		return true;
	};
	
	var text = ["Are you sure you want to go back to Battleship Halberd?\n\nYour progress will be saved"];
	
	var notifNextScript = function()
	{
		scr_PlaySfx(snd_MKSS_ButtonChange);
		
		var targetRoom = rm_MKSS_BattleshipHalberd;
		scr_GoToRoom(targetRoom,false);
		
		scr_MKSS_Stage_End();
		
		scr_MKSS_SaveData(global.selectedSave);
		
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
		scr_PlaySfx(snd_MKSS_ButtonNo);
		
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
	
	var text = ["Are you sure you want to go back to the Title Screen?\n\nYour progress will be saved"];
	
	var notifNextScript = function()
	{
		scr_PlaySfx(snd_MKSS_ButtonChange);
		
		var targetRoom = rm_MKSS_Menu_TitleScreen;
		scr_GoToRoom(targetRoom,false);
		
		scr_MKSS_Stage_End();
		
		scr_MKSS_SaveData(global.selectedSave);
		
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
		scr_PlaySfx(snd_MKSS_ButtonNo);
		
		isClosed = true;
		destroyTimer = destroyTimerMax;
	};
	
	scr_MKSS_UI_Notif_Init_Add("backToTitle",text,notifUnlockMethod,false);
	scr_MKSS_UI_Notif_Init_Add_Prompts("backToTitle","Exit",notifNextScript,"Back",notifBackScript);
	#endregion
	
	#region Delete Save 1
	var notifUnlockMethod = function()
	{
		return true;
	};
	
	var text = ["Delete your save?"];
	
	var notifNextScript = function()
	{
		destroyTimer = 0;
		
		var notifID = global.MKSS_NotifIDs[? "deleteSave2"];
		scr_MKSS_ObtainNotif(notifID,true);
	};
	
	var notifBackScript = function()
	{
		scr_PlaySfx(snd_MKSS_ButtonNo);
		
		isClosed = true;
		destroyTimer = destroyTimerMax;
	};
	
	scr_MKSS_UI_Notif_Init_Add("deleteSave1",text,notifUnlockMethod,false);
	scr_MKSS_UI_Notif_Init_Add_Prompts("deleteSave1","Delete",notifNextScript,"Back",notifBackScript);
	#endregion
	
	#region Delete Save 2
	var notifUnlockMethod = function()
	{
		return true;
	};
	
	var text = ["Are you sure about that?"];
	
	var notifNextScript = function()
	{
		destroyTimer = 0;
		
		scr_PlaySfx(snd_MKSS_DeleteSaveAlert);
		
		var notifID = global.MKSS_NotifIDs[? "deleteSave3"];
		scr_MKSS_ObtainNotif(notifID,true);
	};
	
	var notifBackScript = function()
	{
		scr_PlaySfx(snd_MKSS_ButtonNo);
		
		isClosed = true;
		destroyTimer = destroyTimerMax;
	};
	
	scr_MKSS_UI_Notif_Init_Add("deleteSave2",text,notifUnlockMethod,false);
	scr_MKSS_UI_Notif_Init_Add_Prompts("deleteSave2","Delete",notifNextScript,"Back",notifBackScript);
	#endregion
	
	#region Delete Save 3
	var notifUnlockMethod = function()
	{
		return true;
	};
	
	var notifNextScript = function()
	{
		scr_PlaySfx(snd_MKSS_DeleteSave);
		
		scr_Camera_SetScreenshake(3,1);
		
		isClosed = true;
		destroyTimer = 0;
		
		with (obj_MKSS_Menu_TitleScreen)
		{
			scr_EraseData(currentSelectedSave);
			
			for (var i = 0; i < 3; i++)
			{
				var fileName = "Save" + string(i + 1) + ".ini";
				
				var fileFinal = fileName;
				if (!global.isMobile) fileFinal = environment_get_variable("LOCALAPPDATA") + chr(92) + global.gameTitle + chr(92) + fileName;
				
				saveExists[i] = file_exists(fileFinal);
			}
		}
	};
	
	var notifBackScript = function()
	{
		scr_PlaySfx(snd_MKSS_ButtonNo);
		
		isClosed = true;
		destroyTimer = destroyTimerMax;
	};
	
	var text = ["[c_red]You're sure you won't regret this?[/color]"];
	
	scr_MKSS_UI_Notif_Init_Add("deleteSave3",text,notifUnlockMethod,false);
	scr_MKSS_UI_Notif_Init_Add_Prompts("deleteSave3","Delete",notifNextScript,"Back",notifBackScript);
	#endregion
	#endregion
}