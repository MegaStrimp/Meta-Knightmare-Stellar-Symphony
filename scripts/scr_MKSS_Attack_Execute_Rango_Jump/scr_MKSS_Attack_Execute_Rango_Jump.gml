///@description MKSS - Attack - Execute -  Rango - Jump

function scr_MKSS_Attack_Execute_Rango_Jump()
{
	attackString = global.MKSS_AttackList[attackIndex].ID;
	scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
	#region Owner Variables
	var nearestPlayer = instance_nearest(x,y,obj_Player);
	var angle = point_direction(x,y,nearestPlayer.x,nearestPlayer.y);
	
	hsp = lengthdir_x(6 * speedMultFinal,angle);
	vsp = lengthdir_y(6 * speedMultFinal,angle);
	
	scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_Rango_AI_JumpAndAttack_Jump_Step);
	#endregion
}