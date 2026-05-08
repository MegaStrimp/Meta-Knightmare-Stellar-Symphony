///@description MKSS - Trigger Box - Activation - SS Strimp Check

function scr_MKSS_TriggerBox_Activation_SSStrimpCheck()
{
	if ((!instance_exists(obj_Enemy)) and (!instance_exists(obj_EnemySpawner)))
	{
		with (instance_create_layer(40,200,"Environment",obj_MKSS_Balloon))
		{
			scr_Component_UpAndDown_Setup(0,0,-1,-1);
			
			sprite_index = spr_MKSS_Balloon_Strimp_Idle;
			palSprite = spr_MKSS_Balloon_Palette_Strimp;
			palIndex = 1;
			
			activationScript = scr_MKSS_Balloon_Activation_SSStrimp;
			
			freezeFrameForce = 2;
			vsp = -1 * speedMultFinal;
			destroyOutsideView = true;
			
			instance_destroy(other);
		}
	}
}