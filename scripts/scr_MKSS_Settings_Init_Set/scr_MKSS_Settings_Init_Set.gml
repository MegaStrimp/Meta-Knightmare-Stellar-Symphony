///@description MKSS - Settings - Init - Set

function scr_MKSS_Settings_Init_Set()
{
	#region Setup
	ds_map_clear(global.settingsIDs);
	global.settingsList = [];
	#endregion
	
	#region Categories
	scr_Settings_Init_Add("display","Display",,,scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Display],scr_MKSS_Settings_Component_GoToPause);
	scr_Settings_Init_Add("audio","Audio",,,scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Audio],scr_MKSS_Settings_Component_GoToPause);
	scr_Settings_Init_Add("controls","Controls",,,scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Controls],scr_MKSS_Settings_Component_GoToPause);
	#endregion
	
	#region Display
	scr_Settings_Init_Add("fullscreen","Toggle Fullscreen",,,scr_MKSS_Settings_Component_Fullscreen_Select,,scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],);
	scr_Settings_Init_Add("windowSize","Window Size",,,scr_MKSS_Settings_Component_WindowSize_Select,,scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,scr_MKSS_Settings_Component_WindowSize_Left,,scr_MKSS_Settings_Component_WindowSize_Right,,scr_MKSS_Settings_Component_WindowSize_Draw);
	scr_Settings_Init_Add("shaders","Shaders",,,scr_MKSS_Settings_Component_Shaders_Select,,scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,,,,,scr_MKSS_Settings_Component_Shaders_Draw);
	scr_Settings_Init_Add("cursor","Cursor",,,scr_MKSS_Settings_Component_Cursor_Select,,scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,scr_MKSS_Settings_Component_Cursor_Left,,scr_MKSS_Settings_Component_Cursor_Right,,scr_MKSS_Settings_Component_Cursor_Draw);
	#endregion
	
	#region Audio
	scr_Settings_Init_Add("music","Music Vol",,,,,scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,scr_MKSS_Settings_Component_Music_Left,,scr_MKSS_Settings_Component_Music_Right,,scr_MKSS_Settings_Component_Music_Draw);
	scr_Settings_Init_Add("sfx","Sfx Vol",,,,,scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,scr_MKSS_Settings_Component_Sfx_Left,,scr_MKSS_Settings_Component_Sfx_Right,,scr_MKSS_Settings_Component_Sfx_Draw);
	#endregion
	
	#region Controls
	scr_Settings_Init_Add("remapUp","Key Up",,,scr_MKSS_Settings_Component_ButtonRemap_Select,["up",0],scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,,,,,scr_MKSS_Settings_Component_ButtonRemap_Draw,[0]);
	scr_Settings_Init_Add("remapDown","Key Down",,,scr_MKSS_Settings_Component_ButtonRemap_Select,["down",1],scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,,,,,scr_MKSS_Settings_Component_ButtonRemap_Draw,[1]);
	scr_Settings_Init_Add("remapLeft","Key Left",,,scr_MKSS_Settings_Component_ButtonRemap_Select,["left",2],scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,,,,,scr_MKSS_Settings_Component_ButtonRemap_Draw,[2]);
	scr_Settings_Init_Add("remapRight","Key Right",,,scr_MKSS_Settings_Component_ButtonRemap_Select,["right",3],scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,,,,,scr_MKSS_Settings_Component_ButtonRemap_Draw,[3]);
	scr_Settings_Init_Add("remapA","Key A",,,scr_MKSS_Settings_Component_ButtonRemap_Select,["A",4],scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,,,,,scr_MKSS_Settings_Component_ButtonRemap_Draw,[4]);
	scr_Settings_Init_Add("remapB","Key B",,,scr_MKSS_Settings_Component_ButtonRemap_Select,["B",5],scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,,,,,scr_MKSS_Settings_Component_ButtonRemap_Draw,[5]);
	scr_Settings_Init_Add("remapX","Key X",,,scr_MKSS_Settings_Component_ButtonRemap_Select,["X",6],scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,,,,,scr_MKSS_Settings_Component_ButtonRemap_Draw,[6]);
	scr_Settings_Init_Add("remapY","Key Y",,,scr_MKSS_Settings_Component_ButtonRemap_Select,["Y",7],scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,,,,,scr_MKSS_Settings_Component_ButtonRemap_Draw,[7]);
	scr_Settings_Init_Add("remapL","Key L",,,scr_MKSS_Settings_Component_ButtonRemap_Select,["L",8],scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,,,,,scr_MKSS_Settings_Component_ButtonRemap_Draw,[8]);
	scr_Settings_Init_Add("remapR","Key R",,,scr_MKSS_Settings_Component_ButtonRemap_Select,["R",9],scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,,,,,scr_MKSS_Settings_Component_ButtonRemap_Draw,[9]);
	scr_Settings_Init_Add("remapLT","Key LT",,,scr_MKSS_Settings_Component_ButtonRemap_Select,["LT",10],scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,,,,,scr_MKSS_Settings_Component_ButtonRemap_Draw,[10]);
	scr_Settings_Init_Add("remapRT","Key RT",,,scr_MKSS_Settings_Component_ButtonRemap_Select,["RT",11],scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,,,,,scr_MKSS_Settings_Component_ButtonRemap_Draw,[11]);
	scr_Settings_Init_Add("remapStart","Key Start",,,scr_MKSS_Settings_Component_ButtonRemap_Select,["start",12],scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,,,,,scr_MKSS_Settings_Component_ButtonRemap_Draw,[12]);
	scr_Settings_Init_Add("remapSelect","Key Select",,,scr_MKSS_Settings_Component_ButtonRemap_Select,["select",13],scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default],,,,,,,,,scr_MKSS_Settings_Component_ButtonRemap_Draw,[13]);
	scr_Settings_Init_Add("remapReset","Reset Keys",,,scr_MKSS_Settings_Component_ResetKeys_Select,,scr_MKSS_Settings_Component_LoadPage,[scr_MKSS_Settings_PageSetup_Default]);
	#endregion
}