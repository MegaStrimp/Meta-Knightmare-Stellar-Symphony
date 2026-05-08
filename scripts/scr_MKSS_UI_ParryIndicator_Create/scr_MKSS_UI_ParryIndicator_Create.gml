///@description MKSS - UI - Parry Indicator - Create

function scr_MKSS_UI_ParryIndicator_Create(targetX,targetY,targetDepth,targetDestroyTimer,targetRadiusMax = 24,targetFollowedObject = -1)
{
	with (instance_create_depth(targetX,targetY,targetDepth,obj_MKSS_UI_ParryIndicator))
	{
		destroyTimer = targetDestroyTimer;
		destroyTimerMax = targetDestroyTimer;
		followedObject = targetFollowedObject;
		radiusMax = targetRadiusMax;
	}
}