triggerScript = function()
{
	objectsToDestroyTemp[0] = instance_create_layer(128,0,"Collision",obj_Wall);
	with (objectsToDestroyTemp[0]) image_yscale = 10;
	
	with (instance_create_depth(0,0,0,obj_MKSS_EnemyArena))
	{
		cameraSetsLimits = true;
		objectsToDestroy = other.objectsToDestroyTemp;
		endScript = scr_MKSS_EnemyArena_EndScript_StarryShores_GigantEdge;
		endTimerMax = 0;
		
		scr_Camera_SetLimits(128 + 16,room_width);
		
		scr_Music_SetFade(1,,1);
		
		scr_MKSS_EnemyArena_Add(232,88,obj_MKSS_Enemy_GigantEdge,scr_MKSS_Enemy_GigantEdge_AI_Normal_Setup,,-1,120,-1);
	}
	
	instance_destroy();
}