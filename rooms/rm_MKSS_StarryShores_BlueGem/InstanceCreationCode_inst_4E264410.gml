triggerScript = function()
{
	objectsToDestroyTemp[0] = instance_create_layer(128,0,"Collision",obj_Wall);
	with (objectsToDestroyTemp[0]) image_yscale = 10;
	
	with (instance_create_depth(680,256,0,obj_MKSS_EnemyArena))
	{
		cameraSetsLimits = true;
		objectsToDestroy = other.objectsToDestroyTemp;
		endScript = scr_MKSS_EnemyArena_EndScript_SpawnGemPreset;
		endScriptArgs = [scr_MKSS_ConcentratedGem_Preset_StarryShoresBlue,128 + floor((room_width - 128) / 2),floor(room_height / 2) - 32];
		endTimerMax = 0;
		
		scr_Camera_SetLimits(128 + 16,room_width);
		
		scr_MKSS_EnemyArena_Add(208,32,obj_MKSS_Enemy_Rango,scr_MKSS_Enemy_Rango_AI_Flop_Setup,,,,1);
		scr_MKSS_EnemyArena_Add(400,32,obj_MKSS_Enemy_Rango,scr_MKSS_Enemy_Rango_AI_Flop_Setup,,,,-1);
		scr_MKSS_EnemyArena_Add(304,128,obj_MKSS_Enemy_Rango,scr_MKSS_Enemy_Rango_AI_JumpAndAttack_Setup,,-1,,-1);
		
		scr_MKSS_EnemyArena_Add(320,32,obj_MKSS_Enemy_Rango,scr_MKSS_Enemy_Rango_AI_Flop_Setup,,45,,-1);
		scr_MKSS_EnemyArena_Add(264,64,obj_MKSS_Enemy_Rango,scr_MKSS_Enemy_Rango_AI_Flop_Setup,,,,-1);
		scr_MKSS_EnemyArena_Add(376,64,obj_MKSS_Enemy_Rango,scr_MKSS_Enemy_Rango_AI_Flop_Setup,,90,,-1);
		scr_MKSS_EnemyArena_Add(208,48,obj_MKSS_Enemy_Rango,scr_MKSS_Enemy_Rango_AI_Flop_Setup,,,,-1);
		scr_MKSS_EnemyArena_Add(432,48,obj_MKSS_Enemy_Rango,scr_MKSS_Enemy_Rango_AI_Flop_Setup,,-1,,-1);
		
		scr_MKSS_EnemyArena_Add(328,88,obj_MKSS_Enemy_Trappy,scr_MKSS_Enemy_Trappy_AI_Throw_Setup,,45,,1);
		scr_MKSS_EnemyArena_Add(232,144,obj_MKSS_Enemy_Rango,scr_MKSS_Enemy_Rango_AI_JumpAndAttack_Setup,,45,,-1);
		scr_MKSS_EnemyArena_Add(280,128,obj_MKSS_Enemy_Rango,scr_MKSS_Enemy_Rango_AI_JumpAndAttack_Setup,,45,,-1);
		scr_MKSS_EnemyArena_Add(328,144,obj_MKSS_Enemy_Rango,scr_MKSS_Enemy_Rango_AI_JumpAndAttack_Setup,,45,,-1);
		scr_MKSS_EnemyArena_Add(368,128,obj_MKSS_Enemy_Rango,scr_MKSS_Enemy_Rango_AI_JumpAndAttack_Setup,,45,,-1);
		scr_MKSS_EnemyArena_Add(416,144,obj_MKSS_Enemy_Rango,scr_MKSS_Enemy_Rango_AI_JumpAndAttack_Setup,,-1,,-1);
	}
	
	instance_destroy();
}