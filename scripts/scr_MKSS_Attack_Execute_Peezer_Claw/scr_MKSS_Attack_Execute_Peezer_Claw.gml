///@description MKSS - Attack - Execute - Peezer - Claw

function scr_MKSS_Attack_Execute_Peezer_Claw()
{
	attackString = global.MKSS_AttackList[attackIndex].ID;
	scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
	#region Attack
	with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
	{
		owner = other;
		isEnemy = true;
		dmg = 2;
		followOwner = true;
		followOwnerImageIndex = true;
		isMelee = true;
		freezeFrameForce = 1;
		knockbackAngle = 10;
		knockbackForce = 1;
		click1 = false;
		click2 = false;
		mask_index = spr_MKSS_Attack_Peezer_Claw_Mask;
		dirX = other.dirX;
		image_xscale = other.dirX;
		attackAIStep = scr_MKSS_Attack_Peezer_Claw_Step;
		attackAIEndStep = scr_MKSS_Attack_Peezer_Claw_EndStep;
	}
	#endregion
}