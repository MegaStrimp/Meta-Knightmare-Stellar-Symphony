///@description MKSS - Attack - Execute - Chunky Dee - Dash

function scr_MKSS_Attack_Execute_ChunkyDee_Dash()
{
	attackString = global.MKSS_AttackList[attackIndex].ID;
	scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
	#region Owner Variables
	var nearestPlayer = instance_nearest(x,y,obj_Player);
	
	dirX = 1;
	if (nearestPlayer.x < x) dirX = -1;
	
	scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_ChunkyDee_AI_Normal_Dash_Step);
	#endregion
}