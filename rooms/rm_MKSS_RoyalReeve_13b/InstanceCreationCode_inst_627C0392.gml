triggerScript = function()
{
	objectsToDestroyTemp[0] = instance_create_layer(208,0,"Collision",obj_Wall);
	with (objectsToDestroyTemp[0]) image_yscale = 10;
	objectsToDestroyTemp[1] = instance_create_layer(480,0,"Collision",obj_Wall);
	with (objectsToDestroyTemp[1]) image_yscale = 10;
	
	with (instance_create_depth(0,0,0,obj_MKSS_EnemyArena))
	{
		cameraSetsLimits = true;
		objectsToDestroy = other.objectsToDestroyTemp;
		endTimerMax = 0;
		
		scr_Camera_SetLimits(208 + 16,480);
		
		//scr_MKSS_EnemyArena_Add(704,280,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup,,,,-1);
		//scr_MKSS_EnemyArena_Add(760,280,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup,,-1,,-1);
		
		//scr_MKSS_EnemyArena_Add(736,280,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup,,,,-1);
		//scr_MKSS_EnemyArena_Add(752,232,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Angry_Setup,,-1,,-1);
		
		//scr_MKSS_EnemyArena_Add(584,240,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Angry_Setup);
		//scr_MKSS_EnemyArena_Add(624,264,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Angry_Setup,,-1);
		
		//scr_MKSS_EnemyArena_Add(784,280,obj_MKSS_Enemy_GhostKnight,scr_MKSS_Enemy_GhostKnight_AI_WalkAndAttack_Setup,,-1,,-1);
	}
	
	instance_destroy();
}