///@description MKSS - Attack - Execute - Galaxia - Multisword

function scr_MKSS_Attack_Execute_Galaxia_Multisword()
{
	attackString = global.MKSS_AttackList[attackIndex].ID;
	scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
	#region Owner Variables
	isAttacking = true;
	
	hsp /= 2;
	
	hasAttackAnimation = false;
	scr_ChangeSprite(spriteSet.sprAttackGalaxiaMultisword);
	
	scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Galaxia_Multisword_Step);
	
	canCancelAttackAnimation = false;
	attackCanTurnSprite = false;
	
	drawDirX = dirX;
	
	attackCancelTimer = 30;
	attackCooldownTarget = 20;
	#endregion
}