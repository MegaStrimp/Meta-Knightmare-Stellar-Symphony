///@description MKSS - Enemy - Starless Marx - AI - Normal - Teleport - Animation End

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_Teleport_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprBallIn:
		sprite_index = -1;
		
		if (teleport_RandomCount <= 0)
		{
			teleport_TeleportTimer = teleport_TeleportTimerMax;
		}
		else
		{
			teleport_TeleportTimer = teleport_TeleportTimerMin;
		}
		break;
		
		case spriteSet.sprBallOut:
		var sfx = scr_PlaySfx(snd_MKSS_MarxAppear);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		
		canBeHit = true;
		canHurtPlayer = true;
		
		scr_Enemy_ChangeState_Step(id,teleport_TargetState);

		sprite_index = spriteSet.sprIdle;
		image_index = image_number - 1;
		break;
	}
}