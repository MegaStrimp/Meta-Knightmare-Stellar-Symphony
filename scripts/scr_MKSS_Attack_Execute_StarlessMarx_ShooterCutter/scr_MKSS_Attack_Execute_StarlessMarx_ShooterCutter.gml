///@description MKSS - Attack - Execute - Starless Marx - Shooter Cutter

function scr_MKSS_Attack_Execute_StarlessMarx_ShooterCutter(targetAngle = 0,isParriable = false)
{
	attackString = global.MKSS_AttackList[attackIndex].ID;
	scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
	#region Audio
	var sfx = scr_PlaySfx(snd_MKSS_MarxCutter);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	#endregion
	
	#region Attack
	with (instance_create_depth(x,y,depth + 1,obj_MKSS_Attack))
	{
		owner = other;
		isEnemy = true;
		canBeParried = isParriable;
		dmg = 1;
		knockbackForce = 1;
		hsp = lengthdir_x(4,targetAngle - 25);
		vsp = lengthdir_y(4,targetAngle - 25);
		dirX = -1;
		if ((targetAngle == 45) or (targetAngle == 315)) dirX = 1;
		movementAngle = targetAngle - 25;
		image_xscale = dirX * scale;
		sprite_index = spr_MKSS_Attack_StarlessMarx_ShooterCutter;
		attackAIStep = scr_MKSS_Attack_StarlessMarx_ShooterCutter_Step;
		decelTimer = 10;
	}
	#endregion
}