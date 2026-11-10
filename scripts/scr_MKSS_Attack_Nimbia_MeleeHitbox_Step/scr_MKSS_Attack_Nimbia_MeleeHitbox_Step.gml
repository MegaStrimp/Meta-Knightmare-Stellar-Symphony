///@description MKSS - Attack - Nimbia - Melee Hitbox - Step

function scr_MKSS_Attack_Nimbia_MeleeHitbox_Step()
{
	if (!localPause)
	{
		if (instance_exists(owner))
		{
			x = owner.x;
			y = owner.y;
			
			dirX = owner.dirX;
			image_xscale = dirX * scale;
		}
		else
		{
			instance_destroy();
		}
	}
}