function scr_MKSS_Player_MetaKnight_State_Cutscene_NimbiaMDDownKick_Step(){
	#region Setup
	if (playerState_Setup)
	{	
		playerState_Setup = false;
				
		dirX = 1
		
		distance = 300
	}
	#endregion
	
	var kickAngle = -225
	x = obj_MKSS_Enemy_Nimbia.x + lengthdir_x(distance,kickAngle)
	y = obj_MKSS_Enemy_Nimbia.y + lengthdir_y(distance,kickAngle)
	distance = max(distance - (5*speedMultFinal),20)
}