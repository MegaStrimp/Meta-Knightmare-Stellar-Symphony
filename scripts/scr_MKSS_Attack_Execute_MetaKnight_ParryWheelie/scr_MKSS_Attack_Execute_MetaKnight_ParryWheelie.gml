///@description MKSS - Attack - Execute - Meta Knight - Parry Wheelie

function scr_MKSS_Attack_Execute_MetaKnight_ParryWheelie(playerIndex,currentParriedObject)
{
	with (playerIndex)
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
		
		#region Owner Variables
		isAttacking = true;
		#endregion
	}
	
	#region Parry
	if (instance_exists(currentParriedObject))
	{
		with (instance_create_depth(currentParriedObject.x,currentParriedObject.y,depth,obj_MKSS_Attack))
		{
			target = currentParriedObject;
			owner = playerIndex;
			isEnemy = false;
			destroyAfterCollideWall = true;
			attackWallHitParticleIndex = scr_MKSS_ParticleSet_BlockBreak1;
			hsp = 0;
			vsp = 0;
			movespeed = 4;
			particleTimerMax = 5;
			particleTimer = particleTimerMax;
			afterimageTimerMax = 2;
			afterimageTimer = afterimageTimerMax;
			dmg = MKSS_Base_PlayerContactDamage;
			dirX = -scr_MKSS_Enemy_DirTarget();
			image_xscale = scale * dirX;
			sprite_index = spr_MKSS_Attack_MetaKnight_ParryWheelie;
			attackAIStep = scr_MKSS_Attack_MetaKnight_ParryWheelie_Step;
		}
		
		with (currentParriedObject)
		{
			instance_destroy();
		}
	}
	#endregion
}