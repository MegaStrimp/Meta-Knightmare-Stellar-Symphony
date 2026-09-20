function scr_MKSS_Player_MetaKnight_State_Cutscene_StarlessMarxMDFaceSlam_Step(){
	#region Setup
	if (playerState_Setup)
	{	
		playerState_Setup = false;
		
		dirX = 1
		
		hsp = 0
		vsp = 0
		
		y = 50
		
		attackMakeLightInvincible = true
		attackMakeHeavyInvincible = true
		
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
				if (place_meeting(x,y,obj_MKSS_Enemy_StarlessMarx))
				{
					faceSlamDoTurning = true
					faceSlamTimer = 0
					if (faceSlamFacingAngle == 360)
					{
						faceSlamEnded = true
					}
				}
			}
			else
			{
				circleRadius += 1.5 * speedMultFinal
				faceSlamTimer = min(faceSlamTimer + speedMultFinal,faceSlamInterval)
			}
			circleRadius = clamp(circleRadius,0,50)
			x = (room_width/2) + lengthdir_x(circleRadius,180 + faceSlamFacingAngle)
			y = (room_height/2) + lengthdir_y(circleRadius,180 + faceSlamFacingAngle)
		}
		else
		{
			hsp = 0
			vsp = 0
		}
		
		if (!hasAttackAnimation)
		{
			sprite_index = spriteSet.sprAttackBuzzcutSlash1;
			image_index = 0
		}
		
		scr_MKSS_Player_Component_Movement()
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}