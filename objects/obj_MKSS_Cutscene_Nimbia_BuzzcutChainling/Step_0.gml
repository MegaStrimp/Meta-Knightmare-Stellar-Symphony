if (deflected == false and place_meeting(x,y,obj_MKSS_Enemy_Nimbia))
{
	deflected = true
	obj_MKSS_Enemy_Nimbia.hsp = 1
	direction = irandom_range(90,180)
}