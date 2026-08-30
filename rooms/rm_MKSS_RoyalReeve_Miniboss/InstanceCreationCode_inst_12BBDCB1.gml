triggerScript = function()
{
	objectsToDestroyTemp[0] = instance_create_layer(64,0,"Collision",obj_Wall);
	with (objectsToDestroyTemp[0]) image_yscale = 10;
	
	with (instance_create_depth(0,0,0,obj_MKSS_EnemyArena))
	{
		cameraSetsLimits = true;
		objectsToDestroy = other.objectsToDestroyTemp;
		endScript = scr_MKSS_EnemyArena_EndScript_RoyalReeve_GrandWheelie;
		endTimerMax = 0;
		
		scr_Camera_SetLimits(64 + 16,room_width);
		
		scr_Music_SetFade(1,,1);
		
		var grandWheelieSpawner = scr_MKSS_EnemyArena_Add(560,104,obj_MKSS_Enemy_GrandWheelie,scr_MKSS_Enemy_GrandWheelie_AI_Normal_Setup,,-1,120,-1);
		spawnList[grandWheelieSpawner].bypassViewCheck = true;
	}
	
	instance_destroy();
}