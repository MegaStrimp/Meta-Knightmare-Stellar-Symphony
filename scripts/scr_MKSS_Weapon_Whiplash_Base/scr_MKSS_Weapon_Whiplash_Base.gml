///@description MKSS - Weapon - Whiplash - Base

function scr_MKSS_Weapon_Whiplash_Base()
{
	#region Marked Object
	ds_priority_clear(whiplash_MarkableObjectList);
	
	with (obj_Enemy)
	{
		var distance = distance_to_object(other);
		
		if ((distance <= 48) and (!collision_line(other.x,other.y,x,y,obj_Wall,false,false)))
		{
			ds_priority_add(other.whiplash_MarkableObjectList,id,distance);
		}
	}
	
	whiplash_MarkedObjectID = ds_priority_find_min(whiplash_MarkableObjectList);
	#endregion
	
	#region Target Animation
	if (whiplash_MarkedObjectID != -1)
	{
		targetIndex = (targetIndex + targetSpd) % targetNumber;
		targetScale = sine_wave(global.currentTimePausable / 600,.1,.05,0);
	}
	#endregion
}