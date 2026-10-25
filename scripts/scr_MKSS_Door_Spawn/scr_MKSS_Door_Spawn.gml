///@description MKSS - Door - Spawn

function scr_MKSS_Door_Spawn(targetX,targetY,targetTargetRoom,isSubDoor = false)
{
	var sfx = scr_PlaySfx(snd_MKSS_DoorSpawn);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	
	var door = instance_create_layer(targetX,targetY,"Environment",obj_MKSS_Door);
	
	with (door)
	{
		targetRoom = targetTargetRoom;
		
		hasStars = false;
		
		sprite_index = spr_MKSS_Door_Appear;
		image_index = 0;
		
		if (isSubDoor)
		{
			bigStarSprite = spr_MKSS_Particle_BigStar_Orange;
			doorStarParticleSet = scr_MKSS_ParticleSet_DoorStar_Orange1;
		}
	}
	
	return door;
}