///@description Main

if (!localPause)
{
	#region Movement
	x = xstart + sine_between((global.currentTimePausable / 100),wavePeriod,waveMin,waveMax);
	#endregion
}