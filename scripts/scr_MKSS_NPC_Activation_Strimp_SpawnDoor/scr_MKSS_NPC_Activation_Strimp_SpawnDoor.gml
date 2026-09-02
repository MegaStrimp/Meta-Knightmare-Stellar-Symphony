///@description MKSS - NPC - Activation - Strimp - Spawn Door

function scr_MKSS_NPC_Activation_Strimp_SpawnDoor()
{
	with (instance_create_layer(528,72,"Environment",obj_MKSS_Door))
	{
		targetRoom = rm_MKSS_StarryShores_2;
	}
	
	var sfx = scr_PlaySfx(snd_MKSS_EnemyHurt1);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	var sfx = scr_PlaySfx(snd_MKSS_ButtonChange);
	//audio_sound_pitch(sfx,random_range(.85,1.15));
	
	scr_MKSS_ParticleSet_EnemyHitStars(528,64,true);
	scr_MKSS_ParticleSet_EnemyHitStars(528,64,false);
	
	targetDialogueMappedID = global.MKSS_DialogueIDs[? "strimp_KSW_2"];
	dialogueEndScript = -1;
}