///@description MKSS - Attack - Nimbia - Lightning - Step

function scr_MKSS_Attack_Nimbia_Lightning_Step()
{
	if (!localPause)
	{
		#region Strike
		if (strikeTimer != -1)
		{
			strikeTimer = max(strikeTimer - speedMultFinal,0);
			if (strikeTimer == 0)
			{
				sprite_index = spr_MKSS_Attack_Nimbia_Lightning;
				
				image_alpha = 1;
				
				dmg = dmgTarget;
				
				strikeTimer = -1;
			}
		}
		else
		{
			owner.stop = true;
			
			postStrikeTimer = max(postStrikeTimer - speedMultFinal,0);
			if (postStrikeTimer == 0)
			{
				repeat(32)
				{
					var _len = irandom_range(0,sprite_width);
					
					scr_MKSS_ParticleSet_LightningBall(x + lengthdir_x(_len,image_angle),y + lengthdir_y(_len,image_angle),random_range(-.25,.25),random_range(-.5,.25));
				}
				
				owner.stop = false;
				
				instance_destroy();
			}
		}
		#endregion
		
		#region Position		
		x = owner.x + (owner.hsp * speedMultFinal);
		y = owner.y - 12;
		#endregion
	}
}