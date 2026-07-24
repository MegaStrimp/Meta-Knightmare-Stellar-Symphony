///@description MKSS - Attack - Chasse Emee - Sword Claw - Step

function scr_MKSS_Attack_ChasseEmee_SwordClaw_Step()
{
	if (!localPause)
	{
		#region Position
		x = owner.x + (armX * dirX);
		y = owner.y + armY;
		
		armX += hsp * speedMultFinal;
		armY += vsp * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decel * speedMultFinal);
		vsp = scr_Entity_Friction(vsp,decel * speedMultFinal);
		
		armX = clamp(armX,armXMin,armXMax);
		#endregion
	}
}