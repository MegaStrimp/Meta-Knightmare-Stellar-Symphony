///@description MKSS - Attack - Execute - Trappy - Pearl

function scr_MKSS_Attack_Execute_Trappy_Pearl()
{
	attackString = global.MKSS_AttackList[attackIndex].ID;
	scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
	#region Audio
	var sfx = scr_PlaySfx(snd_MKSS_Slash1);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	#endregion
	
	#region Attack
	with (instance_create_depth(x,y - 8,depth,obj_MKSS_Attack))
	{
		owner = other;
		isEnemy = true;
		dmg = 5;
		destroyAfterCollideWall = true;
		destroyAfterCollidePlatform = true;
		canBeParried = true;
		parryAttackIndex = global.MKSS_AttackIDs[? "metaKnight_ParryTrappyPearl"];
		sprite_index = spr_MKSS_Attack_Trappy_Pearl;
		attackAIStep = scr_MKSS_Attack_Trappy_Pearl_Step;
		dirX = other.dirX;
		autoScale = false;
		vsp = random_range(-4,-2) * speedMultFinal;
		movespeed = random_range(1,2.5);
		grav = .15;
		gravLimit = 2.5;
	}
	#endregion
}