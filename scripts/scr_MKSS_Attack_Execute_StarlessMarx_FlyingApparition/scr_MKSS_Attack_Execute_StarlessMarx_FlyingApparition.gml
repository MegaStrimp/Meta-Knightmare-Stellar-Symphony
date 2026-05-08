///@description MKSS - Attack - Execute - Starless Marx - Flying Apparition

function scr_MKSS_Attack_Execute_StarlessMarx_FlyingApparition()
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
	
	#region Attack
	with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
	{
		owner = other;
		isEnemy = true;
		dmg = 0;
		knockbackForce = 1;
		hsp = irandom_range(2,4) * other.apparitionDir;
		vsp = irandom_range(-2,0);
		sprite_index = global.MKSS_EnemyList[global.MKSS_EnemyIDs[? "starlessMarx"]].spriteSet.sprFly;
		mask_index = sprite_index;
		image_xscale = other.apparitionDir;
		dirX = other.apparitionDir;
		attackAIStep = scr_MKSS_Attack_StarlessMarx_FlyingApparition_Step;
		attackDrawSelf = scr_MKSS_Attack_StarlessMarx_FlyingApparition_DrawSelf;
	}
	#endregion
}