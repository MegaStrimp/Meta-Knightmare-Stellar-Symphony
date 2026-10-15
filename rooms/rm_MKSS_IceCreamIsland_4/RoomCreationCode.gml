///@description Room Creation Code

#region Room Setup
script_execute(scr_MKSS_RoomSetup_IceCreamIsland,true);
#endregion

#region Enemy Arena
with (instance_create_depth(0,0,0,obj_MKSS_EnemyArena))
{
	if (global.MKSS_StageList[global.MKSS_StageIDs[? "iceCreamIsland"]].isBeaten)
	{
		endsTheStage = true;
	}
	else
	{
		endScript = scr_MKSS_EnemyArena_EndScript_IceCreamIsland_ChunkyDee;
	}
	
	//Some Waddle Dees
	scr_MKSS_EnemyArena_Add(146,120,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup,,,,-1);
	scr_MKSS_EnemyArena_Add(216,120,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup,,-1,,-1);
	
	//MORE Waddle Dees
	scr_MKSS_EnemyArena_Add(296,120,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup,,,,-1);
	scr_MKSS_EnemyArena_Add(232,120,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup,,,,-1);
	scr_MKSS_EnemyArena_Add(168,120,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Angry_Setup,,-1,,1);
	
	//The big guy
	scr_MKSS_EnemyArena_Add(168,120,obj_MKSS_Enemy_ChunkyDee,scr_MKSS_Enemy_ChunkyDee_AI_Normal_Setup,,-1,120,-1);
}
#endregion