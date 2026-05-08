///@description Room Creation Code

#region Begin Stage
scr_MKSS_Stage_Begin("fissionFactory");
#endregion

#region Room Setup
script_execute(scr_MKSS_RoomSetup_FissionFactory);
#endregion

#region Stage Intro
scr_MKSS_UI_StageIntro_Create(spr_MKSS_UI_StageIntro_StageTitle_FissionFactory,spr_MKSS_UI_Decal_Pal_FissionFactory);
#endregion