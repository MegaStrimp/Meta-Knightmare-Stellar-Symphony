///@description MKSS - Enemy - Get Stunned

function scr_MKSS_Enemy_GetStunned(targetEnemy)
{
	with (targetEnemy)
	{
		if (enemyAIStep != targetState)
		{
			#region Variables
			canHaveKnockback = true;
			hasKnockback = true;
			prevDefense = defense;
			defense /= 2;
			prevKnockbackResistance = knockbackResistance;
			knockbackResistance /= 1.5;
			prevMetaPointsOnHit = metaPointsOnHit;
			metaPointsOnHit += MKSS_Base_EnemyMetaPointsOnHit_Stun;
			#endregion
		}
		
		#region Change State
		scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_AI_Stun_Step);
		#endregion
	}
}