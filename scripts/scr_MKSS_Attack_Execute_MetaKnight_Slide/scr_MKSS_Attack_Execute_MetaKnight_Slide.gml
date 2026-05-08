///@description MKSS - Attack - Execute - Meta Knight - Slide

function scr_MKSS_Attack_Execute_MetaKnight_Slide()
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
	
	hasAttackAnimation = false;
	scr_ChangeSprite(spriteSet.sprSlide);
	
	scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Slide_Step);
	
	canCancelAttackAnimation = false;
	attackCanTurnSprite = false;
	canAttackCancelTargetState = false;
	
	hsp = movespeedSlide * dirX * speedMultFinal;
	drawDirX = dirX;
	
	attackCancelTimer = 20;
	attackCooldownTarget = 5;
	#endregion
}