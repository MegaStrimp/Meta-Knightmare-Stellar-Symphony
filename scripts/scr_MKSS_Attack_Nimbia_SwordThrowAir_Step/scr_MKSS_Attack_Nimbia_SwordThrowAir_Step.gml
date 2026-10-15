///@description MKSS - Attack - Nimbia - Sword Throw Air - Step

function scr_MKSS_Attack_Nimbia_SwordThrowAir_Step()
{
	if (!localPause)
	{
		#region Sword Impact
		if (!owner.swordImpact)
		{
			if (instance_place(x,y,obj_Wall))
			{
				hsp = 0;
				vsp = 0;
				
				owner.swordImpact = true;
			}
		}
		#endregion
		
		#region Tornado
		tornadoFrameTimer = max(tornadoFrameTimer - speedMultFinal,0);
		if (tornadoFrameTimer == 0)
		{
			tornadoFrame++;
			if (tornadoFrame > tornadoFrameMax) tornadoFrame = 0;
			
			tornadoFrameTimer = tornadoFrameTimerMax;
		}
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}