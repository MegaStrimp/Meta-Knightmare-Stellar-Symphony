///@description Create

#region Initialize Variables
#region Gameplay Variables
global.gameTitle = "Meta Knightmare Stellar Symphony";
global.versionNumber = "BETA " + date_date_string(GM_build_date);

scr_MKSS_Player_Init_Set();
scr_MKSS_Weapon_Init_Set();
scr_MKSS_UpgradeType_Init_Set();
scr_MKSS_Upgrade_Init_Set();
scr_MKSS_SprayPaint_Init_Set();
scr_MKSS_Familiar_Init_Set();
scr_MKSS_Enemy_Init_Set();
scr_MKSS_AttackTypes_Init_Set();
scr_MKSS_Attack_Init_Set();
scr_MKSS_Dialogue_Init_Set();
scr_MKSS_UI_Button_Init_Set();
scr_MKSS_UI_Notif_Init_Set();
scr_MKSS_UI_ScoreBonus_Init_Set();
scr_MKSS_Music_Init_Set();
scr_MKSS_Stage_Init_Set();

for (var i = 0; i < global.maxPlayers; i++)
{
	global.MKSS_PlayerMetaPoints[i] = 0;
	
	global.playerCharacter[i] = global.MKSS_PlayerIDs[? "metaKnight"];
	global.playerAbility[i] = -1;
	global.playerSprayPaint[i] = global.MKSS_SprayPaintIDs[? "meta"];
	global.MKSS_PlayerFamiliar[i] = global.MKSS_FamiliarIDs[? "none"];
	global.MKSS_PlayerSkin[i] = 0;
	global.MKSS_PlayerWeaponList[i] = ds_list_create();
	global.MKSS_PlayerWeaponList_Index[i] = 0;
	global.MKSS_PlayerUpgradeList[i] = ds_list_create();
	
	healPauseTargetHeal[i] = 0;
	healPauseTimer[i] = -1;
	playerMetaQuickTimer[i] = -1;
}

global.pauseScript = scr_MKSS_PauseScript;
global.hasHudCheckScript = scr_MKSS_HasHudCheck;

scr_MKSS_MarkedEnemySetup();
scr_MKSS_MarkedBossSetup();

global.MKSS_PopupQueue = ds_list_create();

global.MKSS_StageHasScore = true;
global.MKSS_StageIntroPlaying = false;

global.MKSS_SpecialDeflation = false;
global.MKSS_SpecialCurrent = 0;
global.MKSS_SpecialTarget = 100;

specialDeflationTimer = -1;
specialDeflationTimerMax = 3;

global.MKSS_MedalScoreTargetBronze = 100;
global.MKSS_MedalScoreTargetSilver = 200;
global.MKSS_MedalScoreTargetGold = 300;
global.MKSS_MedalScoreTargetPlatinum = 400;

global.MKSS_NoDamage = true;

global.MKSS_DisclaimerScreen_Skipped = false;

global.MKSS_MinibossActive = false;
global.MKSS_MinibossIsStunned = false;

global.MKSS_HalberdThemeProgression = 0;
global.MKSS_HalberdTheme = -1;

global.MKSS_MusicPlayingTimestamp = 0;

global.MKSS_CutsceneIsPaused = false;
global.MKSS_CutsceneStopMovement = false;

global.MKSS_GameOverPause = false;

global.MKSS_DeathX = 0;
global.MKSS_DeathY = 0;

global.MKSS_CurrentDecalPalette = -1;

playerMetaQuickTimerMax = 30;

global.MKSS_CurrentMassDestructionObject = -1;

global.MKSS_Tutorial_FirstUpgrade = false;
global.MKSS_Tutorial_FirstUpgrade = true;

global.flag_MKSS_MetaPointCollect = false;
global.flag_MKSS_AbilitySwitch = false;
#endregion
#endregion

#region Hud Setup
scr_UI_SetHud(scr_MKSS_Hud_Setup);
#endregion

#region Pause Screen Setup
scr_Pause_SetPause(scr_MKSS_Pause_Setup);
#endregion

#region Font Setup
global.fontSpriteTitleScreenSave = font_add_sprite_ext(fnt_MKSS_Menu_TitleScreen_Save,"0123456789%",true,0);

global.fontSpriteEnemyHealthbar = font_add_sprite_ext(fnt_MKSS_UI_EnemyHealthbar,"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-",true,-1);

global.fontSpriteHitNumbersBlue = font_add_sprite_ext(fnt_MKSS_UI_HitNumbers_Blue,"0123456789+-",true,0);
global.fontSpriteHitNumbersRed = font_add_sprite_ext(fnt_MKSS_UI_HitNumbers_Red,"0123456789+-",true,0);
global.fontSpriteHitNumbersGreen = font_add_sprite_ext(fnt_MKSS_UI_HitNumbers_Green,"0123456789+-",true,0);
global.fontSpriteHitNumbersYellow = font_add_sprite_ext(fnt_MKSS_UI_HitNumbers_Yellow,"0123456789+-",true,0);

global.fontSpriteMedalNone = font_add_sprite_ext(fnt_MKSS_UI_Medal_None,"0123456789",true,0);
global.fontSpriteMedalBronze = font_add_sprite_ext(fnt_MKSS_UI_Medal_Bronze,"0123456789",true,0);
global.fontSpriteMedalSilver = font_add_sprite_ext(fnt_MKSS_UI_Medal_Silver,"0123456789",true,0);
global.fontSpriteMedalGold = font_add_sprite_ext(fnt_MKSS_UI_Medal_Gold,"0123456789",true,0);
global.fontSpriteMedalPlatinum = font_add_sprite_ext(fnt_MKSS_UI_Medal_Platinum,"0123456789",true,0);

global.fontAndromeda = font_add_sprite_ext(fnt_MKSS_Andromeda,"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.,-':;!?*()&" + chr(47) + chr(92) + "#~+÷{}[]" + chr(34) + "“”<>%_|`0123456789",true,0);
global.fontAndromeda_Small = font_add_sprite_ext(fnt_MKSS_Andromeda_Small,"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.,-':;!?*()&" + chr(47) + chr(92) + "#~+÷{}[]" + chr(34) + "“”<>%_|`0123456789",true,0);
#endregion

#region Set Window Caption
var flavorText = scr_MKSS_SetFlavorText();

window_set_caption(global.gameTitle + " " + string(global.versionNumber) + " - " + string(flavorText));
#endregion

#region Load General & Config
scr_MKSS_LoadGeneral("general.ini");
scr_MKSS_SaveGeneral("general.ini");

scr_MKSS_LoadConfig("config.ini");
scr_MKSS_SaveConfig("config.ini");

scr_MKSS_LoadData(global.selectedSave);

scr_MKSS_DefaultKeybindings();
scr_MKSS_LoadControls("controls.ini");

window_set_fullscreen(global.fullscreen);
#endregion

#region Scribble
scribble_font_set_default("fnt_Advance");
scribble_anim_wave(2,SCRIBBLE_DEFAULT_WAVE_FREQUENCY,SCRIBBLE_DEFAULT_WAVE_SPEED);
#endregion

#region Virtual Buttons
if (global.isMobile)
{
	input_virtual_destroy_all();
	
	global.MKSS_VirtualButton_Thumbstick = input_virtual_create().circle(MKSS_Base_VirtualButton_Thumbstick_X + 2,MKSS_Base_VirtualButton_Thumbstick_Y + 2,MKSS_Base_VirtualButton_Thumbstick_Radius).thumbstick(undefined,"left","right","up","down");
	
	global.MKSS_VirtualButton_A = input_virtual_create().rectangle(MKSS_Base_VirtualButton_A_X1 + 2,MKSS_Base_VirtualButton_A_Y1 + 2,MKSS_Base_VirtualButton_A_X2 + 2,MKSS_Base_VirtualButton_A_Y2 + 2).button("A");
	global.MKSS_VirtualButton_B = input_virtual_create().rectangle(MKSS_Base_VirtualButton_B_X1 + 2,MKSS_Base_VirtualButton_B_Y1 + 2,MKSS_Base_VirtualButton_B_X2 + 2,MKSS_Base_VirtualButton_B_Y2 + 2).button("B");
	global.MKSS_VirtualButton_X = input_virtual_create().rectangle(MKSS_Base_VirtualButton_X_X1 + 2,MKSS_Base_VirtualButton_X_Y1 + 2,MKSS_Base_VirtualButton_X_X2 + 2,MKSS_Base_VirtualButton_X_Y2 + 2).button("X");
	global.MKSS_VirtualButton_Y = input_virtual_create().rectangle(MKSS_Base_VirtualButton_Y_X1 + 2,MKSS_Base_VirtualButton_Y_Y1 + 2,MKSS_Base_VirtualButton_Y_X2 + 2,MKSS_Base_VirtualButton_Y_Y2 + 2).button("Y");
	
	global.MKSS_VirtualButton_L = input_virtual_create().rectangle(MKSS_Base_VirtualButton_L_X1 + 2,MKSS_Base_VirtualButton_L_Y1 + 2,MKSS_Base_VirtualButton_L_X2 + 2,MKSS_Base_VirtualButton_L_Y2 + 2).button("L");
	global.MKSS_VirtualButton_LT = input_virtual_create().rectangle(MKSS_Base_VirtualButton_LT_X1 + 2,MKSS_Base_VirtualButton_LT_Y1 + 2,MKSS_Base_VirtualButton_LT_X2 + 2,MKSS_Base_VirtualButton_LT_Y2 + 2).button("LT");
	global.MKSS_VirtualButton_R = input_virtual_create().rectangle(MKSS_Base_VirtualButton_R_X1 + 2,MKSS_Base_VirtualButton_R_Y1 + 2,MKSS_Base_VirtualButton_R_X2 + 2,MKSS_Base_VirtualButton_R_Y2 + 2).button("R");
	global.MKSS_VirtualButton_RT = input_virtual_create().rectangle(MKSS_Base_VirtualButton_RT_X1 + 2,MKSS_Base_VirtualButton_RT_Y1 + 2,MKSS_Base_VirtualButton_RT_X2 + 2,MKSS_Base_VirtualButton_RT_Y2 + 2).button("RT");
	
	global.MKSS_VirtualButton_Start = input_virtual_create().rectangle(MKSS_Base_VirtualButton_Start_X1 + 2,MKSS_Base_VirtualButton_Start_Y1 + 2,MKSS_Base_VirtualButton_Start_X2 + 2,MKSS_Base_VirtualButton_Start_Y2 + 2).button("start");
	global.MKSS_VirtualButton_Select = input_virtual_create().rectangle(MKSS_Base_VirtualButton_Select_X1 + 2,MKSS_Base_VirtualButton_Select_Y1 + 2,MKSS_Base_VirtualButton_Select_X2 + 2,MKSS_Base_VirtualButton_Select_Y2 + 2).button("select");
}
#endregion

#region Discord Rich Presence
scr_Discord_Init("1175092953597890661");

scr_Discord_Setup(-1,-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
#endregion