///@description Create

#region Initialize Variables
sound = scr_PlaySfx(snd_MKSS_EnemySpawner_Ready);
audio_sound_pitch(sound,random_range(.85,1.15));

particleTimer = 0;
particleTimerMax = 5;
destroyTimer = -1;
#endregion