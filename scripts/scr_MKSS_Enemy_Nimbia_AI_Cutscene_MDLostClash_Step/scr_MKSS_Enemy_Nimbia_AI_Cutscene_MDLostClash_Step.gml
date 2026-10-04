function scr_MKSS_Enemy_Nimbia_AI_Cutscene_MDLostClash_Step(){
	#region Setup
	if (enemyState_Setup)
	{
		hsp = 4
		enemyState_Setup = false;
		clampToRoom = true
	}
	#endregion
	
	if (!localPause)
	{
		hsp = 0//4
		with (obj_MKSS_CameraOffsetController)
		{
			targetXOffset += other.hsp
		}
		scr_Component_SetPosition(hsp,vsp)
	}
}