function scr_MKSS_Player_MetaKnight_State_Cutscene_NimbiaMDGalaxiaCharge_Step(){
	#region Setup
	if (playerState_Setup)
	{	
		playerState_Setup = false;
				
		dirX = 1
		
		hsp = 0
		vsp = 0
		
		attackMakeHeavyInvincible = true
		
		chargeTimer = 30
	}
	#endregion
	
	if (!localPause)
	{	
		
		chargeTimer = max(chargeTimer - speedMultFinal,0)
		
		if (chargeTimer == 0)
		{
			var targetDir = point_direction(x,y,obj_MKSS_Enemy_Nimbia.x,obj_MKSS_Enemy_Nimbia.y)
			var chargeSpeed = 15
			hsp = lengthdir_x(1,targetDir) * chargeSpeed
			vsp = lengthdir_y(1,targetDir) * chargeSpeed
			
			if (place_meeting(x,y,obj_MKSS_Enemy_Nimbia))
			{
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_NimbiaMDClash_Step)
			}
		}
		
		#region Animation
		if (!hasAttackAnimation)
		{
			sprite_index = spriteSet.sprAttackBuzzcutSlash1;
			image_index = 0
		}
		#endregion
		
		scr_MKSS_Player_Component_Movement()
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}