///@description Begin Step

#region Variables
speedMultFinal = global.speedMultGlobal * global.deltaTime;
localPause = global.pauseFinal;
#endregion

if (followedObject != -1)
{
	#region Destroy If Owner Doesn't Exist
	if (!instance_exists(followedObject)) instance_destroy();
	#endregion
	
	#region Follow Owner
	x = followedObject.x;
	y = followedObject.y;
	#endregion
}