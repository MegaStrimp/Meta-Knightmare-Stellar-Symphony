image_angle = direction

if (place_meeting(x,y,obj_MKSS_Player) and deflected == false)
{
	direction = - direction
	deflected = true
}