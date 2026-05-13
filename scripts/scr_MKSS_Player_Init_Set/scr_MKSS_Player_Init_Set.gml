///@description MKSS - Player - Init - Set

function scr_MKSS_Player_Init_Set()
{
	#region Setup
	global.MKSS_PlayerList = [];
	global.MKSS_PlayerIDs = ds_map_create();
	#endregion
	
	#region Players
	#region Meta Knight
	var targetMappedID = scr_MKSS_Player_Init_Add("metaKnight","Meta Knight",scr_MKSS_Player_MetaKnight_Setup);
	
	scr_MKSS_Player_Init_Add_SpriteSet(targetMappedID,0,
	{
		sprIdle: spr_MKSS_Player_MetaKnight_Normal_Base_Idle,
		sprWalk: spr_MKSS_Player_MetaKnight_Normal_Base_Walk,
		sprRun: spr_MKSS_Player_MetaKnight_Normal_Base_Run,
		sprRunTurn: spr_MKSS_Player_MetaKnight_Normal_Base_RunTurn,
		sprJumpReady: spr_MKSS_Player_MetaKnight_Normal_Base_JumpReady,
		sprJump: spr_MKSS_Player_MetaKnight_Normal_Base_Jump,
		sprRoll: spr_MKSS_Player_MetaKnight_Normal_Base_Roll,
		sprFall: spr_MKSS_Player_MetaKnight_Normal_Base_Fall,
		sprFallHop: spr_MKSS_Player_MetaKnight_Normal_Base_Fall,
		sprDuck: spr_MKSS_Player_MetaKnight_Normal_Base_Duck,
		sprUpDuck: spr_MKSS_Player_MetaKnight_Normal_Base_UpDuck,
		sprSquish: spr_MKSS_Player_MetaKnight_Normal_Base_Squish,
		sprSlide: spr_MKSS_Player_MetaKnight_Normal_Base_Slide,
		sprFloat: spr_MKSS_Player_MetaKnight_Normal_Base_Float,
		sprFlap: spr_MKSS_Player_MetaKnight_Normal_Base_Flap,
		sprClimbUp: spr_MKSS_Player_MetaKnight_Normal_Base_ClimbUp,
		sprClimbDown: spr_MKSS_Player_MetaKnight_Normal_Base_ClimbDown,
		sprFloatSpit: spr_MKSS_Player_MetaKnight_Normal_Base_Float,
		sprDoorEnter: spr_MKSS_Player_MetaKnight_Normal_Base_DoorEnter,
		sprHurtNormal: spr_MKSS_Player_MetaKnight_Normal_Base_Hurt_Normal,
		sprHurtShocked: spr_MKSS_Player_MetaKnight_Normal_Base_Hurt_Shocked,
		sprHurtBurned: spr_MKSS_Player_MetaKnight_Normal_Base_Hurt_Burned,
		sprHurtFrozen: spr_MKSS_Player_MetaKnight_Normal_Base_Hurt_Frozen,
		sprStun: spr_MKSS_Player_MetaKnight_Normal_Base_Stun,
		
		sprSlide: spr_MKSS_Player_MetaKnight_Normal_Base_Slide,
		sprParry: spr_MKSS_Player_MetaKnight_Normal_Base_Parry,
		
		sprAttackKick: spr_MKSS_Player_MetaKnight_Normal_Base_Attack_Kick,
		
		sprAttackGalaxiaSlash1: spr_MKSS_Player_MetaKnight_Normal_Base_Attack_Galaxia_Slash1,
		sprAttackGalaxiaSlash2: spr_MKSS_Player_MetaKnight_Normal_Base_Attack_Galaxia_Slash2,
		sprAttackGalaxiaStab: spr_MKSS_Player_MetaKnight_Normal_Base_Attack_Galaxia_Stab,
		sprAttackGalaxiaUpAttack: spr_MKSS_Player_MetaKnight_Normal_Base_Attack_Galaxia_UpAttack,
		sprAttackGalaxiaDownThrust: spr_MKSS_Player_MetaKnight_Normal_Base_Attack_Galaxia_DownAttack,
		sprAttackGalaxiaDownThrustEnd: spr_MKSS_Player_MetaKnight_Normal_Base_Attack_Galaxia_DownAttackEnd,
		sprAttackGalaxiaMachTornado: undefined,
		
		sprAttackBuzzcutSlash1: spr_MKSS_Player_MetaKnight_Normal_Base_Attack_Buzzcut_Slash1,
		sprAttackBuzzcutSlash2: spr_MKSS_Player_MetaKnight_Normal_Base_Attack_Buzzcut_Slash2
	});
	#endregion
	#endregion
}