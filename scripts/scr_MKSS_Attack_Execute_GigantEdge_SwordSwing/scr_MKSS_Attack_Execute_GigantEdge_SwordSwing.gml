///@description MKSS - Attack - Execute - Gigant Edge - Sword Swing

function scr_MKSS_Attack_Execute_GigantEdge_SwordSwing()
{
	attackString = global.MKSS_AttackList[attackIndex].ID;
	scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
	#region Owner Variables
	var nearestPlayer = instance_nearest(x,y,obj_Player);
	
	dirX = 1;
	if (nearestPlayer.x < x) dirX = -1;
	
	scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_GigantEdge_AI_Normal_SwordSwing_Step);
	#endregion
}