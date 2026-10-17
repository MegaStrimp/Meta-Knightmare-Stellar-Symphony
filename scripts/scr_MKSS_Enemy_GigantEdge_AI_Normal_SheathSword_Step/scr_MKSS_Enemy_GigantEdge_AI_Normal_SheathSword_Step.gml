///@description MKSS - Enemy - Gigant Edge - AI - Normal - Sheathe Sword - Step

function scr_MKSS_Enemy_GigantEdge_AI_Normal_SheathSword_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		sprite_index = spriteSet.sprSwordGrab;
		image_index = 0;
		
		var sfx = scr_PlaySfx(snd_MKSS_GigantEdge_Dash2);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Friction
		var decelFinal = decel * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		#endregion
		
		#region Sheath Sword
		if (sprite_index != spriteSet.sprSwordGrab) scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
		#endregion
		
		#region Gravity
		vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
	}
}