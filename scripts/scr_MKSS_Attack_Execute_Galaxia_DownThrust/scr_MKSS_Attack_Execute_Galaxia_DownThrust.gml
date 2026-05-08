///@description MKSS - Attack - Execute - Galaxia - Down Thrust

function scr_MKSS_Attack_Execute_Galaxia_DownThrust()
{
	attackString = global.MKSS_AttackList[attackIndex].ID;
	scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
	#region Audio
	var sfx = scr_PlaySfx(snd_MKSS_Slash1);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	#endregion
	
	#region Owner Variables
	isAttacking = true;
	
	hasAttackAnimation = false;
	scr_ChangeSprite(spriteSet.sprRoll);
	hasAttackAnimation = true;
	
	scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Galaxia_DownThrust_Step);
	
	canCancelAttackAnimation = false;
	attackCanTurnSprite = false;
	attackStopMovement = true;
	canChangeAbility = false;
	
	hsp = 0;
	vsp = 0;
	drawDirX = dirX;
	
	attackCooldownTarget = 10;
	#endregion
}