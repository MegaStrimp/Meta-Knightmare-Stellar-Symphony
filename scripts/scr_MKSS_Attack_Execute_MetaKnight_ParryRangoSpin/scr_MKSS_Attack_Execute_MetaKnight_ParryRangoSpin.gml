///@description MKSS - Attack - Execute - Meta Knight - Parry Rango Spin

function scr_MKSS_Attack_Execute_MetaKnight_ParryRangoSpin(playerIndex,currentParriedObject)
{
	with (playerIndex)
	{
		attackString = global.MKSS_AttackList[attackIndex].ID;
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		#region Audio
		var sfx = scr_PlaySfx(snd_MKSS_Slide);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		#endregion
		
		#region Particles
		scr_MKSS_ParticleSet_Run(x + (16 * -dirX),y + 16,dirX);
		#endregion
		
		#region Owner Variables
		isAttacking = true;
		#endregion
	}
	
	#region Parry
	with (currentParriedObject)
	{
		canBeParried = false;
		owner = playerIndex;
		shakeX = 1;
		shakeY = 1;
		
		x = -10000;
		y = -10000;
		target = instance_nearest(xprevious,yprevious,obj_Enemy);
		x = xprevious;
		y = yprevious;
		
		dirX = 1;
		if (playerIndex.x < x) dirX = -1;
		
		scr_MKSS_Score_Add(points);
		var metaPointsOnHitFinal = irandom_range(0,metaPointsOnHit);
		if (metaPointsOnHitFinal != 0) scr_MKSS_SpawnMetaPoint(metaPointsOnHitFinal,x,y,depth - 1,playerIndex,90 - (dirX * 90));
		
		scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_Rango_AI_JumpAndAttack_Parry_Step);
	}
	#endregion
}