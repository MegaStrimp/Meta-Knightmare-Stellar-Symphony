///@description MKSS - Attack - Starless Marx - Black Hole - Step

function scr_MKSS_Attack_StarlessMarx_BlackHole_Step()
{
	if (!localPause)
	{
		circleAlpha += circleAlphaGain * speedMultFinal;
		circleRadius -= circleSpeed * speedMultFinal;
		
		swirlAngle = (swirlAngle - (swirlRotateSpeed * speedMultFinal)) % 360;
		
		var suckDir = 0;
		var range = 4;
		if (obj_Player.x > x + range) suckDir = -1;
		if (obj_Player.x < x - range) suckDir = 1;
		var suckSpeed = 0;
		var suckSpeedDir = 1;
		
		switch (blackHoleState)
		{
			#region Prepare
			case 0:
			swirlAlpha = min(swirlAlpha + (swirlAlphaGain * speedMultFinal),swirlAlphaMax);
			
			var suckSpeed = .25;
			break;
			#endregion
			
			#region Active
			case 1:
			suckSpeed = 2.25;
			
			swirlAlpha = min(swirlAlpha + (swirlAlphaGain * speedMultFinal),swirlAlphaMax);
			
			particleTimer = max(particleTimer - speedMultFinal,0);
			if (particleTimer == 0)
			{
				scr_MKSS_ParticleSet_MarxBlackHoleEffect(x,y,56,irandom_range(0,359),16);
				
				particleTimer = particleTimerMax;
			}
			
			if (obj_Player.x > x - range) and (obj_Player.x < x + range) 
			{
				with (obj_Player)
				{
					if (playerStateStep != scr_MKSS_Player_MetaKnight_State_StarlessMarxBlackHole_Step) scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_StarlessMarxBlackHole_Step);
				}
			}
			break;
			#endregion
			
			#region End
			case 2:
			swirlAlpha = max(swirlAlpha - (swirlAlphaGain * speedMultFinal * 2),0);
			
			suckSpeed = .25;
			break;
			#endregion
		}
		
		if (blackHoleSuckSpeed > suckSpeed) suckSpeedDir = -1;
		if (blackHoleSuckSpeed >= suckSpeed - (blackHoleSuckAccel * speedMultFinal)) and (blackHoleSuckSpeed <= suckSpeed + (blackHoleSuckAccel * speedMultFinal)) 
		{
			blackHoleSuckSpeed = suckSpeed;
		}
		else blackHoleSuckSpeed += blackHoleSuckAccel * suckSpeedDir * speedMultFinal;
		with (obj_Player)
		{
			if (playerStateStep != scr_MKSS_Player_MetaKnight_State_Parry_Step) x += other.blackHoleSuckSpeed * suckDir * other.speedMultFinal;
		}
	}
}