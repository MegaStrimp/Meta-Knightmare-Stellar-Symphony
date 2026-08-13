///@description MKSS - Attack - Chasse Emee - Cannonball - Step

function scr_MKSS_Attack_ChasseEmee_Cannonball_Step()
{
	if (!localPause)
	{
		#region Position
		if (bounceTimes < bounceTimesMax) or (hasGravity) vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		
		if (bounceDelayTimer != -1)
		{
			bounceDelayTimer = max(bounceDelayTimer - speedMultFinal,0);
			if (bounceDelayTimer == 0)
			{
				bounceDelayTimer = -1;
			}
		}
		else
		{
			if (instance_place(x,y + vsp,obj_Wall)) and (vsp > 0)
			{
				if (bounceTimes > 0)
				{
					gravLimit = vsp;
					
					vsp = -vsp;
					
					bounceTimes--;
				}
				else
				{
					scr_MKSS_ParticleSet_Explosion2(x,y);
					
					instance_destroy();
				}
			}
		}
		
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}