///@description Create

#region Initialize Variables
#region Component Setup
scr_Component_ButtonInputTimer_Setup(5);
#endregion

#region Settings Setup (Make scr_GAME_Settings_Init_Set)
if (ds_map_empty(global.settingsIDs))
{
	#region Categories
	scr_Settings_Init_Add("display","Display",,,scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Display],scr_Settings_Component_GoToPreviousRoom);
	scr_Settings_Init_Add("audio","Audio",,,scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Audio],scr_Settings_Component_GoToPreviousRoom);
	scr_Settings_Init_Add("controls","Controls",,,scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Controls],scr_Settings_Component_GoToPreviousRoom);
	#endregion
	
	#region Display
	scr_Settings_Init_Add("fullscreen","Toggle Fullscreen",,,scr_Settings_Component_Fullscreen_Select,,scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],);
	scr_Settings_Init_Add("windowSize","Window Size",,,scr_Settings_Component_WindowSize_Select,,scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],,,,,scr_Settings_Component_WindowSize_Left,,,,scr_Settings_Component_WindowSize_Draw);
	scr_Settings_Init_Add("shaders","Shaders",,,scr_Settings_Component_Shaders_Select,,scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],,,,,,,,,scr_Settings_Component_Shaders_Draw);
	#endregion
	
	#region Audio
	scr_Settings_Init_Add("music","Music Vol",,,,,scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],,,,,scr_Settings_Component_Music_Left,,scr_Settings_Component_Music_Right,,scr_Settings_Component_Music_Draw);
	scr_Settings_Init_Add("sfx","Sfx Vol",,,,,scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],,,,,scr_Settings_Component_Sfx_Left,,scr_Settings_Component_Sfx_Right,,scr_Settings_Component_Sfx_Draw);
	#endregion
	
	#region Controls
	scr_Settings_Init_Add("remapUp","Key Up",,,scr_Settings_Component_ButtonRemap_Select,["up",0],scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],,,,,,,,,scr_Settings_Component_ButtonRemap_Draw,[0]);
	scr_Settings_Init_Add("remapDown","Key Down",,,scr_Settings_Component_ButtonRemap_Select,["down",1],scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],,,,,,,,,scr_Settings_Component_ButtonRemap_Draw,[1]);
	scr_Settings_Init_Add("remapLeft","Key Left",,,scr_Settings_Component_ButtonRemap_Select,["left",2],scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],,,,,,,,,scr_Settings_Component_ButtonRemap_Draw,[2]);
	scr_Settings_Init_Add("remapRight","Key Right",,,scr_Settings_Component_ButtonRemap_Select,["right",3],scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],,,,,,,,,scr_Settings_Component_ButtonRemap_Draw,[3]);
	scr_Settings_Init_Add("remapA","Key A",,,scr_Settings_Component_ButtonRemap_Select,["A",4],scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],,,,,,,,,scr_Settings_Component_ButtonRemap_Draw,[4]);
	scr_Settings_Init_Add("remapB","Key B",,,scr_Settings_Component_ButtonRemap_Select,["B",5],scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],,,,,,,,,scr_Settings_Component_ButtonRemap_Draw,[5]);
	scr_Settings_Init_Add("remapX","Key X",,,scr_Settings_Component_ButtonRemap_Select,["X",6],scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],,,,,,,,,scr_Settings_Component_ButtonRemap_Draw,[6]);
	scr_Settings_Init_Add("remapY","Key Y",,,scr_Settings_Component_ButtonRemap_Select,["Y",7],scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],,,,,,,,,scr_Settings_Component_ButtonRemap_Draw,[7]);
	scr_Settings_Init_Add("remapL","Key L",,,scr_Settings_Component_ButtonRemap_Select,["L",8],scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],,,,,,,,,scr_Settings_Component_ButtonRemap_Draw,[8]);
	scr_Settings_Init_Add("remapR","Key R",,,scr_Settings_Component_ButtonRemap_Select,["R",9],scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],,,,,,,,,scr_Settings_Component_ButtonRemap_Draw,[9]);
	scr_Settings_Init_Add("remapLT","Key LT",,,scr_Settings_Component_ButtonRemap_Select,["LT",10],scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],,,,,,,,,scr_Settings_Component_ButtonRemap_Draw,[10]);
	scr_Settings_Init_Add("remapRT","Key RT",,,scr_Settings_Component_ButtonRemap_Select,["RT",11],scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],,,,,,,,,scr_Settings_Component_ButtonRemap_Draw,[11]);
	scr_Settings_Init_Add("remapStart","Key Start",,,scr_Settings_Component_ButtonRemap_Select,["start",12],scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],,,,,,,,,scr_Settings_Component_ButtonRemap_Draw,[12]);
	scr_Settings_Init_Add("remapSelect","Key Select",,,scr_Settings_Component_ButtonRemap_Select,["select",13],scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default],,,,,,,,,scr_Settings_Component_ButtonRemap_Draw,[13]);
	scr_Settings_Init_Add("remapReset","Reset Keys",,,scr_Settings_Component_ResetKeys_Select,,scr_Settings_Component_LoadPage,[scr_Settings_PageSetup_Default]);
	#endregion
}
#endregion

#region Menu Variables
playerNum = 0;

selection = 0;
targetKey = "";

buttonsList_Max = 20;

mousePressed = false;
settingPressed = false;

separation = 16;

currentList = ds_list_create();
scr_Settings_PageSetup_Default();
#endregion

#region Keys
var i = 0;
buttonRemap_KeysList[i] = "UP";
buttonRemap_KeysText[i] = input_binding_get("up");
i += 1;
buttonRemap_KeysList[i] = "DOWN";
buttonRemap_KeysText[i] = input_binding_get("down");
i += 1; 
buttonRemap_KeysList[i] = "LEFT";
buttonRemap_KeysText[i] = input_binding_get("left");
i += 1;
buttonRemap_KeysList[i] = "RIGHT";
buttonRemap_KeysText[i] = input_binding_get("right");
i += 1;
buttonRemap_KeysList[i] = "A";
buttonRemap_KeysText[i] = input_binding_get("A");
i += 1;
buttonRemap_KeysList[i] = "B";
buttonRemap_KeysText[i] = input_binding_get("B");
i += 1;
buttonRemap_KeysList[i] = "X";
buttonRemap_KeysText[i] = input_binding_get("X");
i += 1;
buttonRemap_KeysList[i] = "Y";
buttonRemap_KeysText[i] = input_binding_get("Y");
i += 1;
buttonRemap_KeysList[i] = "L";
buttonRemap_KeysText[i] = input_binding_get("L");
i += 1;
buttonRemap_KeysList[i] = "R";
buttonRemap_KeysText[i] = input_binding_get("R");
i += 1;
buttonRemap_KeysList[i] = "LT";
buttonRemap_KeysText[i] = input_binding_get("LT");
i += 1;
buttonRemap_KeysList[i] = "RT";
buttonRemap_KeysText[i] = input_binding_get("RT");
i += 1;
buttonRemap_KeysList[i] = "START";
buttonRemap_KeysText[i] = input_binding_get("start");
i += 1;
buttonRemap_KeysList[i] = "SELECT";
buttonRemap_KeysText[i] = input_binding_get("select");
#endregion
#endregion