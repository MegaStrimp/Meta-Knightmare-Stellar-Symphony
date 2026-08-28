///@description MKSS - Attack - Starless Marx - Minimarx Paint - Step

function scr_MKSS_Attack_StarlessMarx_MinimarxPaint_Step()
{
	if (!localPause)
	{
		#region Splat
		if (!splat)
		{
			x = clamp(x,4,room_width - 4);
			if (x <= 4) and (hsp < 0) hsp = abs(hsp);
			if (x >= room_width + 4) and (hsp > 0) hsp = -abs(hsp);
			
			if (instance_place(x,y,obj_Wall)) and (y >= room_height/2)
			{
				sprite_index = spr_MKSS_Attack_StarlessMarx_MinimarxPaint_Splat;
				image_index = 0;
				
				hsp = 0;
				vsp = 0;
				
				y = 160;
				
				splat = true;
			}
		}
		else
		{
			if (createStartTimer != -1)
			{
				createStartTimer = max(createStartTimer - speedMultFinal,0);
				if (createStartTimer == 0)
				{
					var sfx = scr_PlaySfx(choose(snd_MKSS_Minimarx1,snd_MKSS_Minimarx2,snd_MKSS_Minimarx3,snd_MKSS_Minimarx4));
					audio_sound_pitch(sfx,random_range(.85,1.15));
					
					createStartTimer = -1;
				}
			}
			else
			{
				dirX = max(dirX - (miniSpeedSlow * speedMultFinal),0);
				miniShadowAlpha = max(miniShadowAlpha - (miniSpeedFast * speedMultFinal),0);
				if (createTimer != -1)
				{
					if (createTimer >= createTimerMax - 6) miniScaleX += miniSpeedSlow * speedMultFinal;
					else miniScaleX = max(miniScaleX - (miniSpeedSlow * speedMultFinal),1);
					
					if (!miniScaleBounce) 
					{
						miniScaleY = min(miniScaleY + (miniSpeedFast * speedMultFinal),1.2);
						if (miniScaleY >= 1.2)
						{
							miniScaleX = 1.2;
							
							miniScaleBounce = true;
						}
					}
					else
					{
						miniScaleY = max(miniScaleY - (miniSpeedFast * speedMultFinal),1);
					}
					
					createTimer = max(createTimer - speedMultFinal,0);
					if (createTimer == 0)
					{
						with (instance_create_layer(x,y - 8,"Enemies",obj_MKSS_Enemy_StarlessMinimarx))
						{
							scr_MKSS_Enemy_StarlessMinimarx_AI_Walk_Setup();
							
							dirX = other.miniDir;
							image_xscale = dirX;
						}
						
						instance_destroy();
						
						createTimer = -1;
					}
				}
			}
		}
		#endregion
		
		#region Position
		if (!splat) vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}