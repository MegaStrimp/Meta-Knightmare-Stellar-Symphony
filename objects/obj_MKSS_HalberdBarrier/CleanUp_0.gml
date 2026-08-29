///@description Clean Up

#region Stop Ambience
if (audio_is_playing(ambience)) audio_stop_sound(ambience);
#endregion