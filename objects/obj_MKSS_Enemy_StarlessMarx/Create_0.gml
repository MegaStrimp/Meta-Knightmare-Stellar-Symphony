///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Gameplay Variables
enemyID = global.MKSS_EnemyIDs[? "starlessMarx"];
hp = MKSS_Base_EnemyHP_Boss;
points = 5000;
isBoss = true;

pauseOutsideView = false;
canHaveKnockback = false;

freezeFrameForce = 2;

enemyPhaseTargetHp = [MKSS_Base_EnemyHP_Boss - 100];
enemyPhaseSetupScript = 
[
	function()
	{
		with (obj_MKSS_BgEnv_StarlessMarxArena)
		{
			sprBG = bg_MKSS_BgEnv_StarlessMarxArena_Enraged;
			sprBGPal = bg_MKSS_BgEnv_StarlessMarxArena_Palette_Enraged;
			
			hasOverlay = true;
			
			bgVDir = -1;
		}
		
		with (obj_MKSS_BgEnv_StarlessMarxArena_Ground)
		{
			hasOverlay = true;
		}
	}
];
#endregion

#region Sprites
spriteSet = global.MKSS_EnemyList[enemyID].spriteSet;
sprHurt = spriteSet.sprHurtList;
mask_index = spriteSet.maskIndex;
#endregion

#region AI Scripts
enemyBeginStep = scr_MKSS_Enemy_BeginStep_Normal;
enemyStep = scr_MKSS_Enemy_Step_Normal;
#endregion