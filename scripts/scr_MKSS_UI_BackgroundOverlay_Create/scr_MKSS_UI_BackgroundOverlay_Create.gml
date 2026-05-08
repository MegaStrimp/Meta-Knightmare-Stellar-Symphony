///@description MKSS - UI - Background Overlay - Create

function scr_MKSS_UI_BackgroundOverlay_Create(targetDestroyTimer,targetDepth = layer_get_depth("Collision"),targetCanBePaused = true,targetColorList = [c_black],targetColorTimer = -1)
{
	with (obj_MKSS_UI_BackgroundOverlay) instance_destroy();
	
	var overlay = instance_create_depth(0,0,targetDepth,obj_MKSS_UI_BackgroundOverlay);
	with (overlay)
	{
		canBePaused = targetCanBePaused;
		
		colorList = targetColorList;
		
		colorTimerMax = targetColorTimer;
		colorTimer = colorTimerMax;
		
		destroyTimer = targetDestroyTimer;
	}
	
	return overlay;
}