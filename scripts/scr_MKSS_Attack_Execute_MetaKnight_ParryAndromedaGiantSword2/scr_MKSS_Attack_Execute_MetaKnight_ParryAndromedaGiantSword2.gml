///@description MKSS - Attack - Execute - Meta Knight - Parry Andromeda Giant Sword 2

function scr_MKSS_Attack_Execute_MetaKnight_ParryAndromedaGiantSword2(playerIndex,currentParriedObject)
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
		scr_MKSS_Score_Add(50);
		scr_MKSS_SpawnMetaPoint(3,x,y,depth - 1,playerIndex,90);
		
		scr_Camera_SetScreenshake(4);
		
		with (instance_create_depth(currentParriedObject.x + (48 * currentParriedObject.owner.dirX),currentParriedObject.y,currentParriedObject.depth - 1,obj_MKSS_Attack))
		{
			owner = playerIndex;
			isEnemy = false;
			dmg = -1;
			sprite_index = spr_MKSS_Attack_Andromeda1_GiantSword_Base;
			mask_index = spr_MKSS_Attack_Andromeda1_GiantSword_Base;
			scr_MKSS_Attack_Andromeda1_GiantSwordParry_Setup();
			target = currentParriedObject.owner;
			if (currentParriedObject.owner.dirX == -1) image_angle = 180;
		}
		
		with (currentParriedObject)
		{
			with (owner) scr_Enemy_ChangeState_Step(id,enemyStunStep);
			
			instance_destroy();
		}
	}
	#endregion
}