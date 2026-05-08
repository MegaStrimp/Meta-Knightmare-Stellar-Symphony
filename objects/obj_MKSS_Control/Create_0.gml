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
scr_MKSS_Attack_Init_Set();
scr_MKSS_Dialogue_Init_Set();
scr_MKSS_UI_Button_Init_Set();
scr_MKSS_Music_Init_Set();
scr_MKSS_Stage_Init_Set();

for (var i = 0; i < global.maxPlayers; i++)
{
	global.MKSS_PlayerMetaPoints[i] = 0;
	
	global.playerCharacter[i] = global.MKSS_PlayerIDs[? "metaKnight"];
	global.playerAbility[i] = -1;
	global.playerSprayPaint[i] = global.MKSS_SprayPaintIDs[? "meta"];
	global.MKSS_PlayerSkin[i] = 0;
	global.MKSS_PlayerWeaponList[i] = ds_list_create();
	global.MKSS_PlayerWeaponList_Index[i] = 0;
}

global.pauseScript = scr_MKSS_PauseScript;

scr_MKSS_MarkedEnemySetup();
scr_MKSS_MarkedBossSetup();

global.MKSS_StageHasScore = true;
global.MKSS_StageIntroPlaying = false;

global.MKSS_SpecialCurrent = 0;
global.MKSS_SpecialTarget = 100;

global.MKSS_MedalScoreTargetBronze = 100;
global.MKSS_MedalScoreTargetSilver = 200;
global.MKSS_MedalScoreTargetGold = 300;
global.MKSS_MedalScoreTargetPlatinum = 400;

global.MKSS_DisclaimerScreen_Skipped = false;

global.MKSS_MinibossActive = false;
global.MKSS_MinibossIsStunned = false;

global.MKSS_HalberdThemeProgression = 0;
global.MKSS_HalberdTheme = -1;

global.MKSS_MusicPlayingTimestamp = 0;

global.MKSS_CutsceneIsPaused = false;
global.MKSS_CutsceneStopMovement = false;

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
global.fontSpriteEnemyHealthbar = font_add_sprite_ext(fnt_MKSS_UI_EnemyHealthbar,"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-",true,-1);
global.fontSpriteHitNumbersBlue = font_add_sprite_ext(fnt_MKSS_UI_HitNumbers_Blue,"0123456789+-",true,0);
global.fontSpriteHitNumbersRed = font_add_sprite_ext(fnt_MKSS_UI_HitNumbers_Red,"0123456789+-",true,0);
global.fontSpriteHitNumbersGreen = font_add_sprite_ext(fnt_MKSS_UI_HitNumbers_Green,"0123456789+-",true,0);
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

scr_MKSS_DefaultKeybindings();
scr_MKSS_LoadControls("controls.ini");

window_set_fullscreen(global.fullscreen);
#endregion

#region Discord Rich Presence
scr_Discord_Init("1175092953597890661");

scr_Discord_Setup(-1,-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
#endregion