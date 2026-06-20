///@description MKSS - Enemy - Begin Step - Normal

function scr_MKSS_Enemy_BeginStep_Normal()
{
	#region Healthbar Setup
	if (hpHealthbar == -1)
	{
		if (!isBoss)
		{
			hpHealthbar = hp;
			hpHealthbarMiddle = hp;
		}
	}
	#endregion
	
	#region Shadow
	shadowAlphaTarget = 0;
	
	if (position_meeting(x,y,obj_MKSS_ShadowArea)) shadowAlphaTarget = 1;
	
	shadowAlpha = lerp(shadowAlpha,shadowAlphaTarget,.1);
	
	if (shadowAlpha < 1) shadowAlphaFinal = .66;
	if (shadowAlpha < .66) shadowAlphaFinal = .33;
	if (shadowAlpha < .33) shadowAlphaFinal = 0;
	#endregion
	
	#region Death Pit
	if ((hasDeathPit) and (y >= room_height + floor(global.gameTileSize * 1.5))) 
	{
		if (receivedAttackOwner != -1)
		{
			if (metaPointsOnDeath != 0)
			{
				scr_MKSS_SpawnMetaPoint(metaPointsOnDeath,x,y,depth - 1,receivedAttackOwner,receivedKnockbackAngle);
				metaPointsOnDeath = 0;
			}
			
			if (metaPointsOnOverkill != 0)
			{
				scr_MKSS_SpawnMetaPoint(metaPointsOnOverkill,x,y,depth - 1,receivedAttackOwner,receivedKnockbackAngle);
				metaPointsOnOverkill = 0;
			}
		}
		
		scr_Camera_SetScreenshake(0,1);
		
		deathTimer = 0;
	}
	#endregion
}