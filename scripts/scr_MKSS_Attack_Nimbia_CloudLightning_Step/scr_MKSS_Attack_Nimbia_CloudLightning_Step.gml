///@description MKSS - Attack - Nimbia - Cloud Lightning - Step

function scr_MKSS_Attack_Nimbia_CloudLightning_Step()
{
	if (!localPause)
	{
		#region Impact
		if (instance_place(x,y,obj_Wall))
		{
			with (instance_create_depth(x,y+36,depth - 1,obj_MKSS_Attack))
			{
				owner = other.owner;
				isEnemy = true;
				dmg = 1;
				sprite_index = spr_MKSS_Attack_Nimbia_LightningGroundSmall;
				mask_index = spr_MKSS_Attack_Nimbia_LightningGroundSmall;
				attackAIStep = scr_MKSS_Attack_Nimbia_CloudLightningSmall_Step;
				image_angle = 0;
				hsp = 3;
				vsp = 0;
				lightningTimerMax = 10;
				lightningTimer = lightningTimerMax;
			}
			
			with (instance_create_depth(x,y+36,depth - 1,obj_MKSS_Attack))
			{
				owner = other.owner;
				isEnemy = true;
				dmg = 1;
				sprite_index = spr_MKSS_Attack_Nimbia_LightningGroundSmall;
				mask_index = spr_MKSS_Attack_Nimbia_LightningGroundSmall;
				attackAIStep = scr_MKSS_Attack_Nimbia_CloudLightningSmall_Step;
				image_angle = 180;
				hsp = -3;
				vsp = 0;
				lightningTimerMax = 10;
				lightningTimer = lightningTimerMax;
			}
			
			repeat(irandom_range(8,12))
			{
				scr_MKSS_ParticleSet_LightningBall(x+irandom_range(-6,6),y+irandom_range(-32,32),random_range(-.2,.2),random_range(.25,2.5));
			}
					
			instance_destroy();
		}
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}