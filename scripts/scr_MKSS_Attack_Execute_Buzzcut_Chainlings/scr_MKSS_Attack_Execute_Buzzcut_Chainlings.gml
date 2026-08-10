///@description MKSS - Attack - Execute - Buzzcut - Circle Slash

function scr_MKSS_Attack_Execute_Buzzcut_Chainlings()
{
	attackString = global.MKSS_AttackList[attackIndex].ID;
	scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
	#region Audio
	var sfx = scr_PlaySfx(snd_MKSS_Slide);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	#endregion
	
	#region Owner Variables
	isAttacking = true;
	
	hasAttackAnimation = false;
	scr_ChangeSprite(spriteSet.sprAttackBuzzcutChainlings);
	
	scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Buzzcut_Chainlings_Step);
	
	canCancelAttackAnimation = false;
	attackCanTurnSprite = false;
	canAttackCancelTargetState = false;
	
	attackStopSpeedLimit = true;
	hsp = Buzzcut_Chainlings_Movespeed * dirX * speedMultFinal;
	
	grounded = false;
	hasJumpLimit = false;
	vsp = -(jumpspeed * speedMultFinal);
	
	attackCancelTimer = 300;
	attackCooldownTarget = 0;
	#endregion
}