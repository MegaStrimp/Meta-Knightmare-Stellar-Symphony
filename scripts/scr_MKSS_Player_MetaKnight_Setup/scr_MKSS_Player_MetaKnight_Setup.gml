///@description MKSS - Player - Meta Knight - Setup

function scr_MKSS_Player_MetaKnight_Setup()
{
	#region Character Variables
	global.playerMaxHp[playerNum] = 100;
	
	if (global.playerFirstTimeSetup[playerNum])
	{
		global.playerHp[playerNum] = global.playerMaxHp[playerNum];
		if ((currentAbility == -1) and (ds_list_size(global.MKSS_PlayerWeaponList[playerNum]) != 0))
		{
			global.playerAbility[playerNum] = ds_list_find_value(global.MKSS_PlayerWeaponList[playerNum],0);
			scr_Player_ChangeAbility(id,global.playerAbility[playerNum]);
			script_execute(global.MKSS_WeaponList[global.playerAbility[playerNum]].setupScript);
		}
		
		global.playerFirstTimeSetup[playerNum] = false;
	}
	#endregion
	
	#region Physics
	accel = .1;
	
	decel = .05;
	
	movespeedNormal = 1.5;
	movespeedRun = 2.2;
	movespeedSlide = 3;
	movespeed = movespeedNormal;
	
	gravNormal = .15;
	gravFloat = .05;
	grav = gravNormal;
	
	gravLimitNormal = 2.8;
	gravLimitFloat = .75;
	gravLimit = gravLimitNormal;
	
	jumpspeedNormal = 3.2;
	jumpspeed = jumpspeedNormal;
	
	climbSpeed = 1;
	#endregion
	
	#region Gameplay Variables
	attackCancelTargetState = scr_MKSS_Player_MetaKnight_State_Normal_Step;
	
	isFlying = false;
	
	metaPointFlashTimer = -1;
	metaPointFlashTimerMax = 4;
	
	parryCooldownTimer = -1;
	parryCooldownTimerMax = 90;
	parryCooldownFlashTimer = -1;
	parryCooldownFlashTimerMax = 4;
	parryAttackBuffer = false;
	parryAttackFlag = false;
	canParryAttackTimer = -1;
	canParryAttackTimerMax = 15;
	#endregion
	
	#region Player Attributes
	#endregion
	
	#region Fall Duck
	scr_MKSS_Player_Component_FallDuck_Setup();
	#endregion
	
	#region Up Duck
	scr_MKSS_Player_Component_UpDuck_Setup();
	#endregion
	
	#region Walk Squish
	scr_MKSS_Player_Component_WalkSquish_Setup();
	#endregion
	
	#region Fall Roll
	scr_MKSS_Player_Component_FallRoll_Setup();
	#endregion
	
	#region Fall Hop
	scr_MKSS_Player_Component_FallHop_Setup();
	#endregion
	
	#region Scripts
	playerBeginStep = scr_MKSS_Player_MetaKnight_BeginStep;
	playerStateStep = scr_MKSS_Player_MetaKnight_State_Normal_Step;
	playerStep = scr_MKSS_Player_MetaKnight_Step;
	playerDraw = scr_MKSS_Player_MetaKnight_Draw;
	playerAnimationEnd = scr_MKSS_Player_MetaKnight_AnimationEnd;
	#endregion
	
	#region Sprites
	maskNormal = spr_16x16Mask_MiddleOrigin;
	maskRun = spr_20x16Mask_MiddleOriginOffset;
	mask_index = maskNormal;
	#endregion
	
	#region Palette Variables
	palSprite = global.MKSS_SprayPaintList[global.playerSprayPaint[playerNum]].sprite;
	palIndex_ParryCooldown = spr_MKSS_SprayPaint_Misc_ParryCooldown;
	palIndex_MetaPoint = spr_MKSS_SprayPaint_Misc_MetaPoint;
	#endregion
	
	#region Player Respawn
	if (global.playerRespawn[playerNum])
	{
		global.playerHp[playerNum] = global.playerMaxHp[playerNum];
		
		global.playerRespawn[playerNum] = false;
	}
	#endregion
}