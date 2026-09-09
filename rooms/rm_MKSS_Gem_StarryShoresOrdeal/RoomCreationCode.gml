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
	
	scr_MKSS_EnemyArena_Add(208,152,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup);
	scr_MKSS_EnemyArena_Add(416,152,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup,,-1,,-1);
	
	scr_MKSS_EnemyArena_Add(72,112,obj_MKSS_Enemy_BrontoBurt, scr_MKSS_Enemy_BrontoBurt_AI_FlyStraightHorizontal_Setup);
	scr_MKSS_EnemyArena_Add(560,112,obj_MKSS_Enemy_BrontoBurt, scr_MKSS_Enemy_BrontoBurt_AI_FlyStraightHorizontal_Setup,,-1,,-1);
	
	scr_MKSS_EnemyArena_Add(104,200,obj_MKSS_Enemy_WaddleDee, scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup);
	scr_MKSS_EnemyArena_Add(536,200,obj_MKSS_Enemy_WaddleDee, scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup);
	scr_MKSS_EnemyArena_Add(320,200,obj_MKSS_Enemy_Trappy, scr_MKSS_Enemy_Trappy_AI_Throw_Setup,,-1,,-1);
	
	scr_MKSS_EnemyArena_Add(312,64,obj_MKSS_Enemy_Peezer,scr_MKSS_Enemy_Peezer_AI_WalkAndAttack_Setup);
	scr_MKSS_EnemyArena_Add(208,160,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Angry_Setup);
	scr_MKSS_EnemyArena_Add(416,160,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Angry_Setup,,-1,,-1);
	
	scr_MKSS_EnemyArena_Add(152,152,obj_MKSS_Enemy_BrontoBurt, scr_MKSS_Enemy_BrontoBurt_AI_FlyStraightHorizontal_Setup);
	scr_MKSS_EnemyArena_Add(480,152,obj_MKSS_Enemy_BrontoBurt, scr_MKSS_Enemy_BrontoBurt_AI_FlyStraightHorizontal_Setup);
	scr_MKSS_EnemyArena_Add(32,104,obj_MKSS_Enemy_Peezer,scr_MKSS_Enemy_Peezer_AI_WalkAndAttack_Setup);
	scr_MKSS_EnemyArena_Add(608,104,obj_MKSS_Enemy_Peezer,scr_MKSS_Enemy_Peezer_AI_WalkAndAttack_Setup);
	scr_MKSS_EnemyArena_Add(104,208,obj_MKSS_Enemy_WaddleDee, scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup);
	scr_MKSS_EnemyArena_Add(528,208,obj_MKSS_Enemy_WaddleDee, scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup,,-1,,-1);
	
	scr_MKSS_EnemyArena_Add(312,56,obj_MKSS_Enemy_GhostKnight, scr_MKSS_Enemy_GhostKnight_AI_WalkAndAttack_Setup);
	scr_MKSS_EnemyArena_Add(88,112,obj_MKSS_Enemy_Trappy, scr_MKSS_Enemy_Trappy_AI_Throw_Setup);
	scr_MKSS_EnemyArena_Add(544,112,obj_MKSS_Enemy_Trappy, scr_MKSS_Enemy_Trappy_AI_Throw_Setup,,-1,,-1);
	
	scr_MKSS_EnemyArena_Add(208,152,obj_MKSS_Enemy_GhostKnight, scr_MKSS_Enemy_GhostKnight_AI_WalkAndAttack_Setup);
	scr_MKSS_EnemyArena_Add(424,152,obj_MKSS_Enemy_GhostKnight, scr_MKSS_Enemy_GhostKnight_AI_WalkAndAttack_Setup);
	scr_MKSS_EnemyArena_Add(320,200,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Idle_Setup,,-1,,-1);
}
#endregion