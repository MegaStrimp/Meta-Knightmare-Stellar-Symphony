///@description MKSS - Player - Meta Knight - Animation End

function scr_MKSS_Player_MetaKnight_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprFlap:
		scr_ChangeSprite(spriteSet.sprFloat);
		break;
		
		case spriteSet.sprRoll:
		canFallRoll = false;
		
		scr_ChangeSprite(spriteSet.sprFall,true);
		break;
		
		case spriteSet.sprDoorEnter:
		image_index = image_number - 1;
		break;
		
		case spriteSet.sprAttackKick:
		image_index = image_number - 1;
		break;
		
		case spriteSet.sprAttackGalaxiaStab:
		image_index = image_number - 1;
		break;
		
		case spriteSet.sprAttackGalaxiaSlash1:
		scr_Player_CancelAttack(id,attackIndex);
		image_index = image_number - 1;
		break;
		
		case spriteSet.sprAttackGalaxiaSlash2:
		scr_Player_CancelAttack(id,attackIndex);
		image_index = image_number - 1;
		break;
		
		case spriteSet.sprAttackGalaxiaUpAttack:
		scr_Player_CancelAttack(id,attackIndex);
		image_index = image_number - 1;
		break;
		
		case spriteSet.sprAttackGalaxiaDownThrust:
		image_index = image_number - 1;
		break;
		
		case spriteSet.sprAttackBuzzcutSlash1:
		scr_Player_CancelAttack(id,attackIndex);
		image_index = image_number - 1;
		break;
		
		case spriteSet.sprAttackBuzzcutSlash2:
		scr_Player_CancelAttack(id,attackIndex);
		image_index = image_number - 1;
		break;
	}
}