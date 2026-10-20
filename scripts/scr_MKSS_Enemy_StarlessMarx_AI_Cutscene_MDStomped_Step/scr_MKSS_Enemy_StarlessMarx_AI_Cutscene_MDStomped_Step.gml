function scr_MKSS_Enemy_StarlessMarx_AI_Cutscene_MDStomped_Step(){
	#region Setup
	if (enemyState_Setup)
	{	
		enemyState_Setup = false;

		vsp = 4
		
	}
	#endregion
	
	if (!localPause)
	{
		
		
		scr_Component_SetPosition(hsp,vsp);
		scr_Entity_Collision()
	}
}