///@description Main

if (!localPause)
{
	#region Get Hit
	if (hp > 0)
	{
		with (obj_Attack)
		{
			if ((place_meeting(x,y,other)) and (dmg != -1) and ((!isMultiHit) or ((isMultiHit) and (multiHitFlag))))
			{
				other.lastHitProjectile = id;
				other.knockbackLength = other.knockbackLengthMax;
				other.knockbackAngle = knockbackAngle;
				other.hp -= 1;
				
				if (other.hp <= 0)
				{
				}
			}
		}
	}
	#endregion
	
	#region Knockback
	knockbackLength = lerp(knockbackLength,0,.1);
	#endregion
}