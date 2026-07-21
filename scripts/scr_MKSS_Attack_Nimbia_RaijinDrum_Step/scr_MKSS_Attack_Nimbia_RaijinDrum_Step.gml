///@description MKSS - Attack - Nimbia - Raijin Drum - Step

function scr_MKSS_Attack_Nimbia_RaijinDrum_Step()
{
	if (!localPause)
	{
		#region Particles
		if (particleTimerMax != -1)
		{
			particleTimer = max(particleTimer - speedMultFinal,0);
			if (particleTimer == 0)
			{
				repeat(irandom_range(3,5)) 
				{
					var _len = irandom_range(0,64);
					var _angle = irandom_range(0,359);
					var _spd = random_range(0,1.5);
				
					scr_MKSS_ParticleSet_LightningBall(x + lengthdir_x(_len,_angle),y  + lengthdir_y(_len,_angle),lengthdir_x(_spd,_angle),lengthdir_y(_spd,_angle),-1);
				}
				
				particleTimer = particleTimerMax;
			}
		}
		#endregion
		
		#region Orbit
		orbitAngle = (orbitAngle + (owner.drumOrbitSpeed * owner.drumOrbitDir * speedMultFinal)) % 360;
		
		var _shakeX = random_range(-shake,shake);
		var _shakeY = random_range(-shake,shake);
		x = owner.x + lengthdir_x(owner.drumOrbitLength,orbitAngle) + _shakeX;
		y = owner.y + lengthdir_y(owner.drumOrbitLength,orbitAngle) + _shakeY;
		#endregion
	}
}