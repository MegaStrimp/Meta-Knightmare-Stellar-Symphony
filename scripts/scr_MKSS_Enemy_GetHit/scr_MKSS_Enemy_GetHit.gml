///@description MKSS - Enemy - Get Hit

function scr_MKSS_Enemy_GetHit(targetEnemy,targetOwner,targetDmg,targetKnockbackAngle = 90,targetKnockbackForce = 2,targetSpeedMult = speedMultFinal,targetIsMelee = false,targetBonusLootingAmount = 0,targetEnemyHurtTimerMult = 1,targetCanBeFinisher = false)
{
	if ((targetEnemy.hp > 0) or (targetEnemy.canBeOverkilled))
	{
		scr_PlaySfx(snd_MKSS_EnemyHit);
			
		if (targetEnemy.hitParticleIndex != -1) script_execute(targetEnemy.hitParticleIndex,targetEnemy.x,targetEnemy.y);
			
		targetEnemy.flag_GetHit = true;
			
		targetEnemy.shakeX = 1;
		targetEnemy.shakeY = 1;
			
		if (!targetEnemy.isBoss) scr_MKSS_MarkEnemy(targetEnemy);
			
		targetEnemy.hpHealthbarMiddleTimer = 15;
		targetEnemy.hpHealthbarShakeTimer = 15;
			
		global.MKSS_SpecialCurrent += 5; //STRIMPTODO
			
		var hitByFinisher = false;
			
		var knockbackAngleFinal = targetKnockbackAngle;
		//if (enemyKnockbackBehavior != -1) knockbackAngleFinal = script_execute(enemyKnockbackBehavior,id,targetEnemy);
			
		targetEnemy.receivedAttackOwner = targetOwner;
		targetEnemy.receivedKnockbackAngle = knockbackAngleFinal;
			
		var dmgFinal = -1;
			
		var metaPointsOnHitFinal = irandom_range(0,targetEnemy.metaPointsOnHit);
		if (metaPointsOnHitFinal != 0) scr_MKSS_SpawnMetaPoint(metaPointsOnHitFinal,targetEnemy.x,targetEnemy.y,targetEnemy.depth - 1,targetOwner,knockbackAngleFinal);
			
		if (targetEnemy.canBeHurt)
		{
			targetEnemy.palIndex = 2;
			dmgFinal = floor(targetDmg / targetEnemy.defense);
			var dmgWithKnockback = dmgFinal + targetKnockbackForce;
			if ((targetCanBeFinisher) and (dmgWithKnockback >= targetEnemy.hp))
			{
				hitByFinisher = true;
				dmgFinal = dmgWithKnockback;
			}
				
			targetEnemy.flag_GetHurt = true;
				
			if (targetEnemy.sprHurt != -1) targetEnemy.hurtFrame = scr_WeightedRandomize(targetEnemy.sprHurt);
				
			targetEnemy.hp = max(0,targetEnemy.hp - dmgFinal);
			targetEnemy.hurtTimer = floor(targetEnemy.hurtTimerTarget * targetEnemyHurtTimerMult);
			targetEnemy.flashTimer = floor(targetEnemy.flashTimerTarget * targetEnemyHurtTimerMult);
			
			scr_MKSS_UI_HitNumbers_Create(dmgFinal,,targetEnemy.x,targetEnemy.y - 8,targetEnemy.depth - 1,targetOwner,targetEnemy);
				
			if (targetEnemy.hp <= 0)
			{
				if (targetEnemy.metaPointsOnDeath != 0)
				{
					scr_MKSS_SpawnMetaPoint(targetEnemy.metaPointsOnDeath,targetEnemy.x,targetEnemy.y,targetEnemy.depth - 1,targetOwner,knockbackAngleFinal);
					targetEnemy.metaPointsOnDeath = 0;
				}
					
				var metaPointsFinal = min(irandom_range(0,1),targetEnemy.metaPointsOnOverkill) + (irandom_range(0,targetBonusLootingAmount) * (targetEnemy.metaPointsOnOverkill != 0));
				targetEnemy.metaPointsOnOverkill = max(0,targetEnemy.metaPointsOnOverkill - metaPointsFinal);
				if (metaPointsFinal != 0) scr_MKSS_SpawnMetaPoint(metaPointsFinal,targetEnemy.x,targetEnemy.y,targetEnemy.depth - 1,targetOwner,knockbackAngleFinal);
					
				scr_Camera_SetScreenshake(0,1);
					
				targetEnemy.deathTimerMax = max(5,targetEnemy.deathTimerMax + (targetEnemy.hp / 6) - 1);
				targetEnemy.deathTimer = targetEnemy.deathTimerMax;
			}
		}
			
		var finalKnockbackForce = -1;
		if (targetEnemy.canHaveKnockback)
		{
			finalKnockbackForce = max(0,(targetKnockbackForce / targetEnemy.knockbackResistance) * max(1,hitByFinisher * 2) * random_range(1,1.1) * targetSpeedMult);
			scr_Enemy_ReceiveKnockback(targetEnemy,finalKnockbackForce,knockbackAngleFinal);
		}
			
		var freezeFrameFinal = (targetEnemy.freezeFrameForce * freezeFrameForce * max(1,hitByFinisher * 3)) + ((targetEnemy.hp < 0) * 2);
		scr_Enemy_ReceiveFreezeFrame(targetEnemy,freezeFrameFinal);
			
		if (targetIsMelee) targetOwner.localFreezeFrameTimer = freezeFrameFinal;
			
		scr_Debug_WriteLog(string(object_get_name(targetEnemy.object_index)) + " " + string_copy(string(targetEnemy.id),14,6) + " Received " + string(dmgFinal) + " Damage And " + string(finalKnockbackForce) + " Knockback At " + string(knockbackAngleFinal) + " Degrees From " /*+ string(object_get_name(targetOwner))*/); //STRIMPTODO FIX TARGET OWNER OBJECT INDEX
	}
}