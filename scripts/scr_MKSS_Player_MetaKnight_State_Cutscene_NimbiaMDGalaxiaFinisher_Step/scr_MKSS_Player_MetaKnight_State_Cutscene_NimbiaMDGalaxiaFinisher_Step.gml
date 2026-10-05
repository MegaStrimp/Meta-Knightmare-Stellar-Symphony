function scr_MKSS_Player_MetaKnight_State_Cutscene_NimbiaMDGalaxiaFinisher_Step(){
	#region Setup
	if (playerState_Setup)
	{	
		playerState_Setup = false;
				
		dirX = 1
		
		attackMakeHeavyInvincible = true
		
		hsp = 0
		vsp = 0
		obj_MKSS_Enemy_Nimbia.hsp = 4
	}
	#endregion
	
	scr_Entity_Collision()
	
}