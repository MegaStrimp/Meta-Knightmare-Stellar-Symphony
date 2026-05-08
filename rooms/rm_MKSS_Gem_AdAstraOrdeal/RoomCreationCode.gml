///@description Room Creation Code

#region Begin Stage
scr_MKSS_Stage_Begin("gemArena5");
#endregion

#region Room Setup
script_execute(scr_MKSS_RoomSetup_CrystalSpace);
#endregion

#region Stage Intro
scr_MKSS_UI_GemIntro_Create("Enemy Ordeal","Ad Astra","Defeat Waves of Enemies",global.MKSS_StageIDs[? "gemArena5"],spr_MKSS_UI_Decal_Pal_AdAstra);
#endregion

#region Arena Setup
with (instance_create_depth(0,0,0,obj_MKSS_EnemyArena))
{
	endsTheStage = true;
	
	scr_MKSS_EnemyArena_Add(368,568,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup,,-1,,-1);
	
	scr_MKSS_EnemyArena_Add(248,568,obj_MKSS_Enemy_Bouncy,scr_MKSS_Enemy_Bouncy_AI_Walk_Setup);
	scr_MKSS_EnemyArena_Add(368,568,obj_MKSS_Enemy_Bouncy,scr_MKSS_Enemy_Bouncy_AI_Walk_Setup,,-1,,-1);
}
#endregion