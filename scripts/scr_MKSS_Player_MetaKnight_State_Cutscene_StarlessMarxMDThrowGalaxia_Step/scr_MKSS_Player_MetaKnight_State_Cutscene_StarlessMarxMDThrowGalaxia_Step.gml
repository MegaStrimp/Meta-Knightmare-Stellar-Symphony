function scr_MKSS_Player_MetaKnight_State_Cutscene_StarlessMarxMDThrowGalaxia_Step(){
	#region Setup
	if (playerState_Setup)
	{	
		playerState_Setup = false;
		
		dirX = 1
		
		hsp = 0
		vsp = 0
		
		throwGalaxiaTimer = 40
		thrownGalaxia = false
		
	}
	#endregion
	
	if (!localPause)
	{
		throwGalaxiaTimer = max(throwGalaxiaTimer - speedMultFinal,0)
		if (throwGalaxiaTimer == 0 and thrownGalaxia == false)
		{
			thrownGalaxia = true
			instance_create_depth(x,y,depth-1,obj_MKSS_Cutscene_StarlessMarxGalaxia)
		}
	}
}