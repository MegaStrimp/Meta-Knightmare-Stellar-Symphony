///@description Create

#region Initialize Variables
#region Gameplay Variables
localPause = global.pauseFinal;
speedMultFinal = global.speedMultGlobal * global.speedMultEnvironment * global.deltaTime;

sprite_index = choose(spr_MKSS_BgEnv_WaterShine_1,spr_MKSS_BgEnv_WaterShine_2);

wavePeriod = random_range(2.5,4);
waveMin = -1;
waveMax = 1;
#endregion
#endregion