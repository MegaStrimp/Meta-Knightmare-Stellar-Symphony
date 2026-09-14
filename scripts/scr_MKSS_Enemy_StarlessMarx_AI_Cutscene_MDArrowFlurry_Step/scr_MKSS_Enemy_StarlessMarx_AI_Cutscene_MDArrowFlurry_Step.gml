function scr_MKSS_Enemy_StarlessMarx_AI_Cutscene_MDArrowFlurry_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		spawnArrowTime = 20
		hsp = 4
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		if (hsp == 0)
		{
			if (spawnArrowTime != -1)
			{
				spawnArrowTime = max(spawnArrowTime - speedMultFinal,0)
				if (spawnArrowTime == 0)
				{
					spawnArrowTime = -1
					instance_create_depth(obj_MKSS_Player.x,obj_MKSS_Player.y,depth-1,obj_MKSS_Cutscene_StarlessMarxArrowFlurry_Manager)
				}
			}
		}
		else
		{
			hsp = scr_Entity_Friction(hsp,0.1)
		}
		scr_Component_SetPosition(hsp,vsp);
	}
}