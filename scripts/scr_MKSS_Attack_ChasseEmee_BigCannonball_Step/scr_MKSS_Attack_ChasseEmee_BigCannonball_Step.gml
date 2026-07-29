///@description MKSS - Attack - Chasse Emee - Big Cannonball - Step

function scr_MKSS_Attack_ChasseEmee_BigCannonball_Step()
{
	if (!localPause)
	{
		#region Big Cannonball
		if (sprite_index != spr_MKSS_Attack_ChasseEmee_BigCannonball)
		{
			if (y <= -32)
			{
				hsp = 0;
				vsp = 6;
				
				if (sprite_index == spr_MKSS_Attack_ChasseEmee_BigCannonball_BackgroundGreen) 
				{
					canBeParried = true;
				}
				
				sprite_index = spr_MKSS_Attack_ChasseEmee_BigCannonball;
				mask_index = spr_MKSS_Attack_ChasseEmee_BigCannonball;				
			}
		}
		
		if (instance_place(x,y + vsp,obj_Wall)) and (vsp > 0) and (y >= 32)
		{
			scr_MKSS_ParticleSet_Explosion2(x,y);
					
			instance_destroy();
		}
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}