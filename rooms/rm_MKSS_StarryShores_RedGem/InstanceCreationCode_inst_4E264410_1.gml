triggerScript = function()
{
	objectsToDestroyTemp[0] = instance_create_layer(128,0,"Collision",obj_Wall);
	with (objectsToDestroyTemp[0]) image_yscale = 10;
	
	with (instance_create_depth(680,256,0,obj_MKSS_EnemyArena))
	{
		cameraSetsLimits = true;
		objectsToDestroy = other.objectsToDestroyTemp;
		endScript = scr_MKSS_EnemyArena_EndScript_SpawnGemPreset;
		endScriptArgs = [scr_MKSS_ConcentratedGem_Preset_StarryShoresRed,128 + floor((room_width - 128) / 2),floor(room_height / 2) - 32];
		endTimerMax = 0;
		
		scr_Camera_SetLimits(128 + 16,room_width);
		
		//Some Peezers
		scr_MKSS_EnemyArena_Add(416,40,obj_MKSS_Enemy_Peezer,scr_MKSS_Enemy_Peezer_AI_WalkAndAttack_Setup,,,,-1);
		scr_MKSS_EnemyArena_Add(440,88,obj_MKSS_Enemy_Peezer,scr_MKSS_Enemy_Peezer_AI_WalkAndAttack_Setup,,-1,,-1);
		
		//Some Peezers MIRRORED!!
		scr_MKSS_EnemyArena_Add(192,40,obj_MKSS_Enemy_Peezer,scr_MKSS_Enemy_Peezer_AI_WalkAndAttack_Setup,,,,1);
		scr_MKSS_EnemyArena_Add(168,88,obj_MKSS_Enemy_Peezer,scr_MKSS_Enemy_Peezer_AI_WalkAndAttack_Setup,,-1,,1);
		
		//Bring in the Ghost Knights
		scr_MKSS_EnemyArena_Add(440,88,obj_MKSS_Enemy_GhostKnight,scr_MKSS_Enemy_GhostKnight_AI_WalkAndAttack_Setup,,45,,-1);
		scr_MKSS_EnemyArena_Add(416,40,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Angry_Setup,,,,-1);
		scr_MKSS_EnemyArena_Add(192,40,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Angry_Setup,,-1,,1);
		
		//Harder combo
		scr_MKSS_EnemyArena_Add(168,88,obj_MKSS_Enemy_GhostKnight,scr_MKSS_Enemy_GhostKnight_AI_WalkAndAttack_Setup,,45,,1);
		scr_MKSS_EnemyArena_Add(440,88,obj_MKSS_Enemy_GhostKnight,scr_MKSS_Enemy_GhostKnight_AI_WalkAndAttack_Setup,,45,,-1);
		scr_MKSS_EnemyArena_Add(168,88,obj_MKSS_Enemy_Peezer,scr_MKSS_Enemy_Peezer_AI_WalkAndAttack_Setup,,-1,,1);
		
		//The Big Ghost Knight >:)		(and his subjects)
		scr_MKSS_EnemyArena_Add(424,88,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup,,,,-1);
		scr_MKSS_EnemyArena_Add(448,88,obj_MKSS_Enemy_WaddleDee,scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup,,,,-1);
		scr_MKSS_EnemyArena_Add(384,88,obj_MKSS_Enemy_GhoulKnight,scr_MKSS_Enemy_GhoulKnight_AI_WalkAndAttack_Setup,,-1,,-1);
	}
	
	instance_destroy();
}