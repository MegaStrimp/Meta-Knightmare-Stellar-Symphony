///@description Main

if (!localPause)
{
	#region State Timer
	if (stateTimer != -1)
	{
		stateTimer = max(stateTimer - speedMultFinal,0);
		if (stateTimer == 0)
		{
			state += 1;
			
			switch (state)
			{
				case 1:
				var sfx = scr_PlaySfx(snd_MKSS_MetaPointCollect1);
				audio_sound_pitch(sfx,random_range(.95,1.05));
				
				instance_create_layer(592,32,"Environment",obj_MKSS_MetaPoint_Passive_Medium);
				
				scr_MKSS_ParticleSet_Sparkle(592,32);
				
				stateTimer = 5;
				break;
				
				case 2:
				var sfx = scr_PlaySfx(snd_MKSS_MetaPointCollect1);
				audio_sound_pitch(sfx,random_range(.95,1.05));
				
				instance_create_layer(704,32,"Environment",obj_MKSS_MetaPoint_Passive_Medium);
				
				scr_MKSS_ParticleSet_Sparkle(704,32);
				
				stateTimer = 5;
				break;
				
				case 3:
				var sfx = scr_PlaySfx(snd_MKSS_MetaPointCollect1);
				audio_sound_pitch(sfx,random_range(.95,1.05));
				
				instance_create_layer(592,112,"Environment",obj_MKSS_MetaPoint_Passive_Medium);
				
				scr_MKSS_ParticleSet_Sparkle(592,112);
				
				stateTimer = 5;
				break;
				
				case 4:
				var sfx = scr_PlaySfx(snd_MKSS_MetaPointCollect1);
				audio_sound_pitch(sfx,random_range(.95,1.05));
				
				instance_create_layer(704,112,"Environment",obj_MKSS_MetaPoint_Passive_Medium);
				
				scr_MKSS_ParticleSet_Sparkle(704,112);
				
				stateTimer = 5;
				break;
				
				case 5:
				var sfx = scr_PlaySfx(snd_MKSS_MetaPointCollect1);
				audio_sound_pitch(sfx,random_range(.95,1.05));
				
				instance_create_layer(600,72,"Environment",obj_MKSS_MetaPoint_Passive_Small);
				
				scr_MKSS_ParticleSet_Sparkle(600,72);
				
				stateTimer = 5;
				break;
				
				case 6:
				var sfx = scr_PlaySfx(snd_MKSS_MetaPointCollect1);
				audio_sound_pitch(sfx,random_range(.95,1.05));
				
				instance_create_layer(648,40,"Environment",obj_MKSS_MetaPoint_Passive_Small);
				
				scr_MKSS_ParticleSet_Sparkle(648,40);
				
				stateTimer = 5;
				break;
				
				case 7:
				var sfx = scr_PlaySfx(snd_MKSS_MetaPointCollect1);
				audio_sound_pitch(sfx,random_range(.95,1.05));
				
				instance_create_layer(696,72,"Environment",obj_MKSS_MetaPoint_Passive_Small);
				
				scr_MKSS_ParticleSet_Sparkle(696,72);
				
				stateTimer = 5;
				break;
				
				case 8:
				var sfx = scr_PlaySfx(snd_MKSS_MetaPointCollect1);
				audio_sound_pitch(sfx,random_range(.95,1.05));
				
				instance_create_layer(648,104,"Environment",obj_MKSS_MetaPoint_Passive_Small);
				
				scr_MKSS_ParticleSet_Sparkle(648,104);
				
				stateTimer = 45;
				break;
				
				case 9:
				var sfx = scr_PlaySfx(snd_MKSS_FoodAppear);
				audio_sound_pitch(sfx,random_range(.95,1.05));
				
				instance_create_layer(616,80,"Environment",obj_MKSS_Food_MaximTomato);
				
				scr_MKSS_ParticleSet_Sparkle(616,80);
				
				scr_MKSS_Door_Spawn(640,104,rm_MKSS_RoyalReeve_8,true);
				
				instance_destroy();
				
				stateTimer = -1;
				break;
			}
		}
	}
	#endregion
}