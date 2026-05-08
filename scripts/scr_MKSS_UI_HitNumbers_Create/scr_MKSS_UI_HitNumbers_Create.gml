///@description MKSS - UI - Hit Numbers - Create

function scr_MKSS_UI_HitNumbers_Create(targetText,targetFont = fnt_MKSS_UI_HitNumbers_Blue,targetX = x,targetY = y,targetDepth = depth,targetAttackOwner = -1,targetAttackTarget = -1)
{
	var textOffset = 0;
	with (obj_MKSS_UI_HitNumbers)
	{
		if ((attackOwner == targetAttackOwner) and (attackTarget == targetAttackTarget))
		{
			textOffset += text;
			
			instance_destroy();
		}
	}
	
	with (instance_create_depth(targetX,targetY,targetDepth,obj_MKSS_UI_HitNumbers))
	{
		text = targetText + textOffset;
		font = targetFont;
		attackOwner = targetAttackOwner;
		attackTarget = targetAttackTarget;
	}
}