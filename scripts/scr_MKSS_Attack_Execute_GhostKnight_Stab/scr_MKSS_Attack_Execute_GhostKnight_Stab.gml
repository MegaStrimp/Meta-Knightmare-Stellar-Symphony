///@description MKSS - Attack - Execute - Ghost Knight - Stab

function scr_MKSS_Attack_Execute_GhostKnight_Stab()
{
	attackString = global.MKSS_AttackList[attackIndex].ID;
	scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
	#region Attack
	with (instance_create_depth(x,y,depth,obj_MKSS_Attack))
	{
		owner = other;
		isEnemy = true;
		dmg = 20;
		followOwner = true;
		followOwnerImageIndex = true;
		pauseAfterAnimation = true;
		isMelee = true;
		freezeFrameForce = 1;
		knockbackAngle = 10;
		knockbackForce = 1;
		sprite_index = spr_MKSS_Enemy_GhostKnight_Effects_Attack;
		mask_index = spr_MKSS_Attack_GhostKnight_Stab_Mask;
		dirX = other.dirX;
		image_xscale = other.dirX;
		attackAIEndStep = scr_MKSS_Attack_GhostKnight_Stab_EndStep;
	}
	#endregion
}