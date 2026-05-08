///@description Main

if (!localPause)
{
	#region Movement
	if (jumpspeed != 0) scr_Component_UpAndDown_Step();
	#endregion
	
	#region Position
	scr_Component_SetPosition(0,vsp);
	#endregion
	
	#region Destroy
	if (isDestroyed)
	{
		spr_MKSS_ParticleSet_BalloonExplode(x,y,explodeSprite,palSprite,palIndex);
		
		instance_destroy();
	}
	#endregion
	
	#region Activation
	var activated = false;
	
	with (obj_Attack)
	{
		if ((!isEnemy) and (place_meeting(x,y,other)))
		{
			activated = true;
			
			var freezeFrameFinal = (other.freezeFrameForce * freezeFrameForce * max(1,canBeFinisher * 3));
			scr_Enemy_ReceiveFreezeFrame(other,freezeFrameFinal);
			
			if (isMelee) owner.localFreezeFrameTimer = freezeFrameFinal;
		}
	}
	
	if (activated)
	{
		scr_PlaySfx(snd_MKSS_EnemyHurt1);
		
		isDestroyed = true;
		if (activationScript != -1) script_execute(activationScript);
	}
	#endregion
}

#region Local Freeze Frame Timer
if (localFreezeFrameTimer != -1)
{
	localFreezeFrameTimer = max(localFreezeFrameTimer - speedMultFinal,0);
	if (localFreezeFrameTimer == 0)
	{
		localFreezeFrameTimer = -1;
	}
}
#endregion