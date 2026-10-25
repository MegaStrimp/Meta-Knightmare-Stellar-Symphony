///@description MKSS - NPC - Activation - Strimp - Spawn Door

function scr_MKSS_NPC_Activation_Strimp_SpawnDoor()
{
	scr_MKSS_Door_Spawn(528,72,rm_MKSS_StarryShores_2,true);
	
	var sfx = scr_PlaySfx(snd_MKSS_EnemyHurt1);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	var sfx = scr_PlaySfx(snd_MKSS_ButtonChange);
	//audio_sound_pitch(sfx,random_range(.85,1.15));
	
	scr_MKSS_ParticleSet_EnemyHitStars(528,64,depth,true);
	scr_MKSS_ParticleSet_EnemyHitStars(528,64,depth,false);
	
	targetDialogueMappedID = global.MKSS_DialogueIDs[? "strimp_KSW_2"];
	dialogueEndScript = -1;
}