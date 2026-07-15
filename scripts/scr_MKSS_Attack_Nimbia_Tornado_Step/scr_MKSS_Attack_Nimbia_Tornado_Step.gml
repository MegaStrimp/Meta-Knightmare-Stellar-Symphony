///@description MKSS - Attack - Nimbia - Tornado - Step

function scr_MKSS_Attack_Nimbia_Tornado_Step()
{
	if (!localPause)
	{
		#region Air Movement
		if (airMovement)
		{
			dirX = sign(hsp);			
			hsp = clamp(hsp + (accel * moveDir * speedMultFinal),-speedMax,speedMax);
			
			if ((moveDir == -1) and (x <= xMiddle-distance)) or ((moveDir == 1) and (x >= xMiddle+distance))
			{
				moveDir = -moveDir;
			}
			
			if (instance_place(x,y,obj_Wall))
			{
				repeat(20)
				{
					scr_MKSS_ParticleSet_NimbiaCloud(x+irandom_range(-16,16),y-8+irandom_range(-16,16),random_range(-.25,.25),random_range(-1,0),-1)
				}
						
				instance_destroy();
			}
		}
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}