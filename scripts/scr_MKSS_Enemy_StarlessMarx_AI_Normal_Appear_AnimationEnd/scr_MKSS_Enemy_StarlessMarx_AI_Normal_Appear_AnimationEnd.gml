///@description MKSS - Enemy - Starless Marx - AI - Normal - Appear - Animation End

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_Appear_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprAppear:
		scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_StarlessMarx_AI_Normal_Intro_Step);
		enemyAnimationEnd = -1;
		
		var sfx = scr_PlaySfx(snd_MKSS_MarxAppear);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		var sfx = scr_PlaySfx(snd_MKSS_MarxLaugh1);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		
		sprite_index = spriteSet.sprIdle;
		image_index = 0;
		break;
	}
}