function scr_MKSS_Enemy_StarlessMarx_AI_Cutscene_MDFaceSlam_Step(){
	#region Setup
	if (enemyState_Setup)
	{	
		enemyState_Setup = false;
		
		dirX = -1
		
		hsp = 0
		vsp = 0
		
		y = 50
		
		faceSlamFacingAngle = 0
		faceSlamDoTurning = false
		faceSlamInterval = 30
		faceSlamTimer = faceSlamInterval

		faceSlamEnded = false
		
		circleRadius = 50
		
	}
	#endregion
	
	if (!localPause)
	{
		if (faceSlamEnded == false)
		{
			if (faceSlamDoTurning == true)
			{
				faceSlamFacingAngle = clamp(faceSlamFacingAngle + (2 * speedMultFinal),0,360)
				if (faceSlamFacingAngle == 360)
				{
					faceSlamDoTurning = false
				}
			}
			if (faceSlamTimer == faceSlamInterval)
			{
				circleRadius -= 3 * speedMultFinal
				if (place_meeting(x,y,obj_MKSS_Player))
				{
					faceSlamDoTurning = true
					faceSlamTimer = 0
					if (faceSlamFacingAngle == 360)
					{
						faceSlamEnded = true
						hsp = 5
						vsp = 0
					}
				}
			}
			else
			{
				circleRadius += 1.5 * speedMultFinal
				faceSlamTimer = min(faceSlamTimer + speedMultFinal,faceSlamInterval)
			}
			circleRadius = clamp(circleRadius,0,50)
			x = (room_width/2) + lengthdir_x(circleRadius,faceSlamFacingAngle)
			y = (room_height/2) + lengthdir_y(circleRadius,faceSlamFacingAngle)
		}
		else
		{
			hsp = scr_Entity_Friction(hsp,0.5)
		}
	scr_Component_SetPosition(hsp,vsp);
	}
}