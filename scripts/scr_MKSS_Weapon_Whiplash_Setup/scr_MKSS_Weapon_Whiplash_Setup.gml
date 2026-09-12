///@description MKSS - Weapon - Whiplash - Setup

function scr_MKSS_Weapon_Whiplash_Setup()
{
	whiplash_MarkableObjectList = ds_priority_create();
	whiplash_MarkedObjectID = -1;
	
	targetIndex = 0;
	targetSpd = sprite_get_speed(spr_MKSS_Weapon_Whiplash_Target) / 60;
	targetNumber = sprite_get_number(spr_MKSS_Weapon_Whiplash_Target);
	targetScale = 0;
}