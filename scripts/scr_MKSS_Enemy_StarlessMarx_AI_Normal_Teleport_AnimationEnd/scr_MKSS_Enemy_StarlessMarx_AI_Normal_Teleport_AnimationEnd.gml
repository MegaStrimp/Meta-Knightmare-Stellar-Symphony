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
		scr_PlaySfx(snd_MKSS_MarxAppear);
		
		canBeHit = true;
		canHurtPlayer = true;
		
		scr_Enemy_ChangeState_Step(id,teleport_TargetState);

		sprite_index = spriteSet.sprIdle;
		image_index = image_number - 1;
		break;
	}
}