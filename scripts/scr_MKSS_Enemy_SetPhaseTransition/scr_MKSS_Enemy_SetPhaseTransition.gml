///@description MKSS - Enemy - Set Phase Transition

function scr_MKSS_Enemy_SetPhaseTransition(targetEnemy,targetState = scr_MKSS_Enemy_AI_PhaseTransition_Step)
{
	with (targetEnemy)
	{
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