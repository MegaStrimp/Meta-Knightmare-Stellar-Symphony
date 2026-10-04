function scr_MKSS_Enemy_Nimbia_AI_Cutscene_MDBuzzsawBlock_Step(){
	#region Setup
	if (enemyState_Setup)
	{
		hsp = 0
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		hsp = scr_Entity_Friction(hsp,0.1)
		scr_Component_SetPosition(hsp,vsp);
	}
}