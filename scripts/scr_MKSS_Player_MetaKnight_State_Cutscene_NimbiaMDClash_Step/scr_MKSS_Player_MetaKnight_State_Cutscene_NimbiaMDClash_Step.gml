function scr_MKSS_Player_MetaKnight_State_Cutscene_NimbiaMDClash_Step(){
	#region Setup
	if (playerState_Setup)
	{	
		playerState_Setup = false;
		
		dirX = 1
		
		hsp = 0
		vsp = 0
		
		attackMakeHeavyInvincible = true
	}
	#endregion
}