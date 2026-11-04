///@description MKSS - Attack - Execute - Buzzcut - Finisher

function scr_MKSS_Attack_Execute_Buzzcut_Finisher()
{
	attackString = global.MKSS_AttackList[attackIndex].ID;
	scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
	#region Audio
	var sfx = scr_PlaySfx(snd_MKSS_EyeShine);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	#endregion
	
	#region Owner Variables
	isAttacking = true;
	
	hasAttackAnimation = true;
	scr_ChangeSprite(spriteSet.sprAttackBuzzcutFinisherReady,true);
	
	scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Buzzcut_Finisher_Step);
	
	canCancelAttackAnimation = false;
	attackCanTurnSprite = false;
	canAttackCancelTargetState = false;
	
	attackCancelTimer = 210;
	attackCooldownTarget = 0;
	#endregion
}