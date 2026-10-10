///@description MKSS - Enemy - Get Stunned

function scr_MKSS_Enemy_GetStunned(targetEnemy)
{
	with (targetEnemy)
	{
		if (enemyAIStep != scr_MKSS_Enemy_AI_Stun_Step)
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
		
		if (hasCorpse)
		{
			var sfx = scr_PlaySfx(snd_MKSS_Boss_Death1);
			audio_sound_pitch(sfx,random_range(.85,1.15));
			
			scr_MKSS_UI_BackgroundOverlay_Create(10,layer_get_depth("Player") + 1,false,[c_red],,true).alpha = .2;
		}
		
		#region Change State
		scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_AI_Stun_Step);
		#endregion
	}
}