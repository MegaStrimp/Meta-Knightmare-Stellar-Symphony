///@description MKSS - Attack - Execute - Meta Knight - Parry Marx Dash

function scr_MKSS_Attack_Execute_MetaKnight_ParryMarxDash(playerIndex,currentParriedObject)
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
	if (instance_exists(currentParriedObject))
	{
		scr_MKSS_ParticleSet_Explosion2(x,y);
					
		with (instance_create_depth(currentParriedObject.owner.x,currentParriedObject.owner.y,depth - 1,obj_MKSS_Attack))
		{
			owner = playerIndex;
			isEnemy = false;
			dmg = 4;
			bonusValue = MKSS_Base_AttackBonusValue;
			canBreakBlocks = true;
			canBeFinisher = true;
			isMelee = false;
			freezeFrameForce = 2;
			enemyHurtTimerMult = 1.25;
			dirX = -playerIndex.dirX;
			knockbackAngle = 90 - (dirX * 45);
			knockbackForce = 3;
			destroyTimer = 30;
			mask_index = spr_64x64Mask_MiddleOrigin;
			visible = false;
			attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_Impact;
		}
					
		scr_MKSS_Score_Add(50);
		//scr_MKSS_SpawnMetaPoint(3,x,y,depth - 1,playerIndex,90);
		
		scr_MKSS_Enemy_GetStunned(currentParriedObject.owner);
					
		var sfx = scr_PlaySfx(snd_MKSS_EnemyHit);
		audio_sound_pitch(sfx,random_range(.85,1.15));
					
		shakeX = 4;
					
		scr_Camera_SetScreenshake(4);
					
		script_execute(currentParriedObject.owner.enemyGetHit,currentParriedObject.owner,4,3,90 - (45 * sign(x - currentParriedObject.x)),playerIndex,currentParriedObject.speedMultFinal);
		
		with (currentParriedObject)
		{
			instance_destroy();
		}
	}
	#endregion
}