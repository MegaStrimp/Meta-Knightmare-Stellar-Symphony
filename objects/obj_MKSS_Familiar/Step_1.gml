///@description Begin Step

#region Variables
localPause = global.pauseFinal;
speedMultFinal = global.speedMultGlobal * global.speedMultPlayer * global.deltaTime;
#endregion

if (followedObject != -1)
{
	#region Destroy If Owner Doesn't Exist
	if (!instance_exists(followedObject)) instance_destroy();
	#endregion
	
	#region Follow Owner
	dirX = followedObject.dirX;
	
	x = lerp(x,followedObject.x + followedObject.hsp - (24 * followedObject.dirX),.15);
	y = lerp(y,followedObject.y + followedObject.vsp - 24 + sine_between((global.currentTimePausable / 100),1,-2,2),.15);
	#endregion
}