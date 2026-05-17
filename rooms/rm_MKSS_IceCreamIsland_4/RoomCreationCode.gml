///@description Room Creation Code

#region Room Setup
script_execute(scr_MKSS_RoomSetup_IceCreamIsland,true);
#endregion

#region Enemy Arena
with (instance_create_depth(0,0,0,obj_MKSS_EnemyArena))
{
	//endScript = scr_MKSS_EnemyArena_EndScript_ChunkyEndCutscene; STRIMPTODO
	
	scr_MKSS_EnemyArena_Add(168,120,obj_MKSS_Enemy_ChunkyDee,scr_MKSS_Enemy_ChunkyDee_AI_Normal_Setup,,-1,120,-1);
}
#endregion