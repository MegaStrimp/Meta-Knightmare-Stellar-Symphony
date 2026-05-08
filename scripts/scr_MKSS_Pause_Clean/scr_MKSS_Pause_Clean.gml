///@description MKSS - Pause - Clean

function scr_MKSS_Pause_Clean()
{
	if (surface_exists(MKSS_GamePause_CircleSurface)) surface_free(MKSS_GamePause_CircleSurface);
	if (surface_exists(MKSS_GamePause_CircleSurfaceOutline)) surface_free(MKSS_GamePause_CircleSurfaceOutline);
}