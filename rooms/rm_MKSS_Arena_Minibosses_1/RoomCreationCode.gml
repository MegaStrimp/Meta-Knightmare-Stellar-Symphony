///@description Room Creation Code

#region Room Setup
script_execute(scr_MKSS_RoomSetup_Arena_Battle);
#endregion

#region Background
scr_Camera_SetBackground(scr_MKSS_SetBackground_CrystalSpace);
#endregion

with (instance_create_depth(0,0,0,obj_MKSS_EnemyArena))
{
	endsTheStage = true;
	endsTheStage_TargetRoom = rm_MKSS_Arena_Lobby;
	//endScript = scr_MKSS_EnemyArena_EndScript_ArenaProgress; STRIMPTODO
	
	scr_MKSS_EnemyArena_Add(248,200,obj_MKSS_Enemy_ChunkyDee,scr_MKSS_Enemy_ChunkyDee_AI_Normal_Setup,[true,false],-1,120,-1);
}