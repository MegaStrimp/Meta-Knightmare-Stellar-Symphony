///@description MKSS - Enemy - Chasse-Emee - AI - Normal - Intro - Step

function scr_MKSS_Enemy_ChasseEmee_AI_Normal_Intro_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		hsp = movespeedIntro * speedMultFinal * dirX;
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		hsp = scr_Entity_Friction(hsp,decelIntro);
		
		scr_Camera_SetScreenshake(hsp);
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
		
		#region Animation
		sprite_index = spriteSet.sprIntro;
		#endregion
	}
}