///@description MKSS - Enemy - Set Phase Transition

function scr_MKSS_Enemy_SetPhaseTransition(targetEnemy,targetState = scr_MKSS_Enemy_AI_PhaseTransition_Step)
{
	with (targetEnemy)
	{
		#region Reset from Stun
		if (enemyAIStep == scr_MKSS_Enemy_AI_Stun_Step)
		{
			canHaveKnockback = false;
			hasKnockback = false;
			defense = prevDefense;
			knockbackResistance = prevKnockbackResistance;
			metaPointsOnHit = prevMetaPointsOnHit;
			flashTimer = -1;
			palIndex = 1;
		}
		#endregion
		
		#region Variables
		prevDefense = defense;
		defense *= 5;
		prevKnockbackResistance = knockbackResistance;
		knockbackResistance *= 5;
		#endregion
		
		#region Change State
		scr_Enemy_ChangeState_Step(id,targetState);
		#endregion
	}
}