///@description MKSS - Attack - Andromeda 1 - Parry Projectile - Step

function scr_MKSS_Attack_Andromeda1_ParryProjectile_Step()
{
	if (!localPause)
	{
		#region Particles
		if (particleTimer != -1)
		{
			particleTimer = max(particleTimer - speedMultFinal,0);
			if (particleTimer == 0)
			{
				repeat(irandom_range(2,5))
				{
					scr_MKSS_ParticleSet_Common(x + irandom_range(-6,6),y + irandom_range(-6,6),spr_MKSS_Particle_SpaceBall,3);
				}
				
				particleTimer = particleTimerMax;
			}
		}
		#endregion
		
		#region Launch
		if (launchTimer != -1)
		{
			spd = scr_Entity_Friction(spd,decel * speedMultFinal);
			
			launchTimer = max(launchTimer - speedMultFinal,0);
			if (launchTimer == 0)
			{
				launchTimer = -1;
			}
		}
		else
		{
			spd = min(spd + (accel * speedMultFinal),spdMax);
			
			if (target != -1)
			{
				var targetAngle = point_direction(x,y,target.x,target.y);
				
				if (point_distance(angle,0,targetAngle,0) > turnSpeed)
				{
					turnSpeed = min(turnSpeed + (turnSpeedAccel * speedMultFinal),turnSpeedMax);
					
					turnDir = sign(angle_difference(targetAngle,angle));
					scr_Debug_WriteLog(turnDir)
					
					angle = (angle + (turnSpeed * turnDir * speedMultFinal)) % 360;
					if (angle < 0) angle += 360;
				}
				else
				{
					angle = targetAngle;
				}
			}
		}
		#endregion
		
		#region Position
		hsp = lengthdir_x(spd,angle);
		vsp = lengthdir_y(spd,angle);
		
		image_angle = (image_angle + (rotateSpd * -turnDir) * speedMultFinal) % 360;
		
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}