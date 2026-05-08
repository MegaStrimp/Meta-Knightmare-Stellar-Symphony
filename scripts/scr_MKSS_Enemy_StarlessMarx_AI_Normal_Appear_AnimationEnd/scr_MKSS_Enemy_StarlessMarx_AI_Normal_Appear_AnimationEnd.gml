///@description MKSS - Enemy - Starless Marx - AI - Normal - Appear - Animation End

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_Appear_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprAppear:
		scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_StarlessMarx_AI_Normal_Intro_Step);
		enemyAnimationEnd = -1;
		
		scr_PlaySfx(snd_MKSS_MarxAppear);
		scr_PlaySfx(snd_MKSS_MarxLaugh1);
		
		sprite_index = spriteSet.sprIdle;
		image_index = 0;
		break;
	}
}