///@description Room Creation Code

#region Begin Stage
if (!global.inStage) scr_MKSS_Stage_Begin("starryShoresOrdeal");
#endregion

#region Room Setup
script_execute(scr_MKSS_RoomSetup_CrystalSpace);
#endregion

#region Stage Intro
scr_MKSS_UI_GemIntro_Create("Enemy Ordeal","Starry Shores","Defeat Waves of Enemies",global.MKSS_StageIDs[? "starryShoresOrdeal"]);
#endregion

#region Arena Setup
with (instance_create_depth(0,0,0,obj_MKSS_EnemyArena))
{
	endsTheStage = true;
	
	scr_MKSS_EnemyArena_Add(368,292,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup,,-1,,-1);
	
	scr_MKSS_EnemyArena_Add(248,292,obj_MKSS_Enemy_Bouncy,scr_MKSS_Enemy_Bouncy_AI_Walk_Setup);
	scr_MKSS_EnemyArena_Add(368,292,obj_MKSS_Enemy_Bouncy,scr_MKSS_Enemy_Bouncy_AI_Walk_Setup,,-1,,-1);
	
	scr_MKSS_EnemyArena_Add(216,242,obj_MKSS_Enemy_Bouncy,scr_MKSS_Enemy_Bouncy_AI_Walk_Setup);
	scr_MKSS_EnemyArena_Add(320,194,obj_MKSS_Enemy_WaddleDee, scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup);
	scr_MKSS_EnemyArena_Add(424,242,obj_MKSS_Enemy_Bouncy,scr_MKSS_Enemy_Bouncy_AI_Walk_Setup,,-1,,-1);
	
	scr_MKSS_EnemyArena_Add(320,188,obj_MKSS_Enemy_Peezer,scr_MKSS_Enemy_Peezer_AI_WalkAndAttack_Setup);
	scr_MKSS_EnemyArena_Add(190,290,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Angry_Setup);
	scr_MKSS_EnemyArena_Add(448,290,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Angry_Setup,,-1,,-1);
	
	scr_MKSS_EnemyArena_Add(184,242,obj_MKSS_Enemy_Bouncy,scr_MKSS_Enemy_Bouncy_AI_Walk_Setup);
	scr_MKSS_EnemyArena_Add(456,242,obj_MKSS_Enemy_Bouncy,scr_MKSS_Enemy_Bouncy_AI_Walk_Setup);
	scr_MKSS_EnemyArena_Add(70,196,obj_MKSS_Enemy_Peezer,scr_MKSS_Enemy_Peezer_AI_WalkAndAttack_Setup);
	scr_MKSS_EnemyArena_Add(568,196,obj_MKSS_Enemy_Peezer,scr_MKSS_Enemy_Peezer_AI_WalkAndAttack_Setup);
	scr_MKSS_EnemyArena_Add(190,150,obj_MKSS_Enemy_WaddleDee, scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup);
	scr_MKSS_EnemyArena_Add(448,150,obj_MKSS_Enemy_WaddleDee, scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup,,-1,,-1);
}
#endregion