///@description MKSS - Weapon - Init - Set

function scr_MKSS_Weapon_Init_Set()
{
	#region Setup
	global.MKSS_WeaponList = [];
	global.MKSS_WeaponIDs = ds_map_create();
	#endregion
	
	#region Weapons
	#region Buzzcut
	//var targetMappedID = scr_MKSS_Weapon_Init_Add("none","None");
	#endregion
	
	#region Galaxia
	var targetMappedID = scr_MKSS_Weapon_Init_Add("galaxia","Galaxia",scr_MKSS_Weapon_Galaxia_Setup,scr_MKSS_Weapon_Galaxia_Base,spr_MKSS_Sword_Galaxia_HudIcon,spr_MKSS_Sword_Galaxia_HudIcon_Small);
	
	scr_MKSS_Weapon_Init_Add_SpriteSet(targetMappedID,
	{
		sprSwordGrounded: spr_MKSS_Sword_Galaxia_Grounded,
		
		sprIdle: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Idle,
		sprWalk: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Walk,
		sprRun: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Run,
		sprRunTurn: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_RunTurn,
		sprJumpReady: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_JumpReady,
		sprJump: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Jump,
		sprRoll: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Roll,
		sprFall: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Fall,
		sprFallHop: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Fall,
		sprDuck: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Duck,
		sprUpDuck: undefined,
		sprSquish: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Idle,
		sprSlide: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Slide,
		sprFloat: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Float,
		sprFlap: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Flap,
		sprClimbUp: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_ClimbUp,
		sprClimbDown: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_ClimbDown,
		sprFloatSpit: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Float,
		sprDoorEnter: undefined,
		sprHurtNormal: undefined,
		sprHurtShocked: undefined,
		sprHurtBurned: undefined,
		sprHurtFrozen: undefined,
		sprStun: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Stun,
		
		sprSlide: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Slide,
		sprParry: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Parry,
		
		sprAttackGalaxiaSlash1: undefined,
		sprAttackGalaxiaSlash2: undefined,
		sprAttackGalaxiaStab: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Attack_Stab,
		sprAttackGalaxiaUpAttack: undefined,
		sprAttackGalaxiaDownThrust: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Attack_DownAttack,
		sprAttackGalaxiaDownThrustEnd: spr_MKSS_Player_MetaKnight_Normal_Sword_Galaxia_Attack_DownAttackEnd,
		sprAttackGalaxiaMachTornado: undefined,
		
		sprAttackBuzzcutSlash1: undefined,
		sprAttackBuzzcutSlash2: undefined
	});
	
	scr_MKSS_Weapon_Init_Add_Palette(targetMappedID,spr_MKSS_Player_MetaKnight_Normal_Sword_Palette_Galaxia);
	#endregion
	
	#region Buzzcut
	var targetMappedID = scr_MKSS_Weapon_Init_Add("buzzcut","Buzzcut",scr_MKSS_Weapon_Buzzcut_Setup,scr_MKSS_Weapon_Buzzcut_Base,spr_MKSS_Sword_Buzzcut_HudIcon,spr_MKSS_Sword_Buzzcut_HudIcon_Small);
	
	scr_MKSS_Weapon_Init_Add_SpriteSet(targetMappedID,
	{
		sprSwordGrounded: undefined,
		
		sprIdle: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_Idle,
		sprWalk: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_Walk,
		sprRun: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_Run,
		sprRunTurn: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_RunTurn,
		sprJumpReady: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_JumpReady,
		sprJump: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_Jump,
		sprRoll: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_Roll,
		sprFall: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_Fall,
		sprFallHop: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_Fall,
		sprDuck: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_Duck,
		sprUpDuck: undefined,
		sprSquish: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_Idle,
		sprSlide: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_Slide,
		sprFloat: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_Float,
		sprFlap: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_Flap,
		sprClimbUp: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_ClimbUp,
		sprClimbDown: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_ClimbDown,
		sprFloatSpit: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_Float,
		sprDoorEnter: undefined,
		sprHurtNormal: undefined,
		sprHurtShocked: undefined,
		sprHurtBurned: undefined,
		sprHurtFrozen: undefined,
		sprStun: undefined,
		
		sprSlide: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_Slide,
		sprParry: spr_MKSS_Player_MetaKnight_Normal_Sword_Buzzcut_Parry,
		
		sprAttackGalaxiaSlash1: undefined,
		sprAttackGalaxiaSlash2: undefined,
		sprAttackGalaxiaStab: undefined,
		sprAttackGalaxiaUpAttack: undefined,
		sprAttackGalaxiaDownThrust: undefined,
		sprAttackGalaxiaDownThrustEnd: undefined,
		sprAttackGalaxiaMachTornado: undefined,
		
		sprAttackBuzzcutSlash1: undefined,
		sprAttackBuzzcutSlash2: undefined
	});
	#endregion
	
	#region Whiplash
	var targetMappedID = scr_MKSS_Weapon_Init_Add("whiplash","Whiplash",scr_MKSS_Weapon_Whiplash_Setup,scr_MKSS_Weapon_Whiplash_Base,spr_MKSS_Sword_Whiplash_HudIcon,spr_MKSS_Sword_Whiplash_HudIcon_Small);
	
	scr_MKSS_Weapon_Init_Add_SpriteSet(targetMappedID,
	{
		sprSwordGrounded: undefined,
		
		sprIdle: undefined,
		sprWalk: undefined,
		sprRun: undefined,
		sprRunTurn: undefined,
		sprJumpReady: undefined,
		sprJump: undefined,
		sprRoll: undefined,
		sprFall: undefined,
		sprFallHop: undefined,
		sprDuck: undefined,
		sprUpDuck: undefined,
		sprSquish: undefined,
		sprSlide: undefined,
		sprFloat: undefined,
		sprFlap: undefined,
		sprClimbUp: undefined,
		sprClimbDown: undefined,
		sprFloatSpit: undefined,
		sprDoorEnter: undefined,
		sprHurtNormal: undefined,
		sprHurtShocked: undefined,
		sprHurtBurned: undefined,
		sprHurtFrozen: undefined,
		sprStun: undefined,
		
		sprSlide: undefined,
		sprParry: undefined,
		
		sprAttackGalaxiaSlash1: undefined,
		sprAttackGalaxiaSlash2: undefined,
		sprAttackGalaxiaStab: undefined,
		sprAttackGalaxiaUpAttack: undefined,
		sprAttackGalaxiaDownThrust: undefined,
		sprAttackGalaxiaDownThrustEnd: undefined,
		sprAttackGalaxiaMachTornado: undefined,
		
		sprAttackBuzzcutSlash1: undefined,
		sprAttackBuzzcutSlash2: undefined
	});
	#endregion
	
	#region Trifecta
	var targetMappedID = scr_MKSS_Weapon_Init_Add("trifecta","Trifecta",scr_MKSS_Weapon_Trifecta_Setup,scr_MKSS_Weapon_Trifecta_Base,spr_MKSS_Sword_Trifecta_HudIcon,spr_MKSS_Sword_Trifecta_HudIcon_Small);
	
	scr_MKSS_Weapon_Init_Add_SpriteSet(targetMappedID,
	{
		sprSwordGrounded: undefined,
		
		sprIdle: undefined,
		sprWalk: undefined,
		sprRun: undefined,
		sprRunTurn: undefined,
		sprJumpReady: undefined,
		sprJump: undefined,
		sprRoll: undefined,
		sprFall: undefined,
		sprFallHop: undefined,
		sprDuck: undefined,
		sprUpDuck: undefined,
		sprSquish: undefined,
		sprSlide: undefined,
		sprFloat: undefined,
		sprFlap: undefined,
		sprClimbUp: undefined,
		sprClimbDown: undefined,
		sprFloatSpit: undefined,
		sprDoorEnter: undefined,
		sprHurtNormal: undefined,
		sprHurtShocked: undefined,
		sprHurtBurned: undefined,
		sprHurtFrozen: undefined,
		sprStun: undefined,
		
		sprSlide: undefined,
		sprParry: undefined,
		
		sprAttackGalaxiaSlash1: undefined,
		sprAttackGalaxiaSlash2: undefined,
		sprAttackGalaxiaStab: undefined,
		sprAttackGalaxiaUpAttack: undefined,
		sprAttackGalaxiaDownThrust: undefined,
		sprAttackGalaxiaDownThrustEnd: undefined,
		sprAttackGalaxiaMachTornado: undefined,
		
		sprAttackBuzzcutSlash1: undefined,
		sprAttackBuzzcutSlash2: undefined
	});
	#endregion
	
	#region Stella
	var targetMappedID = scr_MKSS_Weapon_Init_Add("stella","Stella",scr_MKSS_Weapon_Stella_Setup,scr_MKSS_Weapon_Stella_Base,spr_MKSS_Sword_Stella_HudIcon,spr_MKSS_Sword_Stella_HudIcon_Small);
	
	scr_MKSS_Weapon_Init_Add_SpriteSet(targetMappedID,
	{
		sprSwordGrounded: undefined,
		
		sprIdle: undefined,
		sprWalk: undefined,
		sprRun: undefined,
		sprRunTurn: undefined,
		sprJumpReady: undefined,
		sprJump: undefined,
		sprRoll: undefined,
		sprFall: undefined,
		sprFallHop: undefined,
		sprDuck: undefined,
		sprUpDuck: undefined,
		sprSquish: undefined,
		sprSlide: undefined,
		sprFloat: undefined,
		sprFlap: undefined,
		sprClimbUp: undefined,
		sprClimbDown: undefined,
		sprFloatSpit: undefined,
		sprDoorEnter: undefined,
		sprHurtNormal: undefined,
		sprHurtShocked: undefined,
		sprHurtBurned: undefined,
		sprHurtFrozen: undefined,
		sprStun: undefined,
		
		sprSlide: undefined,
		sprParry: undefined,
		
		sprAttackGalaxiaSlash1: undefined,
		sprAttackGalaxiaSlash2: undefined,
		sprAttackGalaxiaStab: undefined,
		sprAttackGalaxiaUpAttack: undefined,
		sprAttackGalaxiaDownThrust: undefined,
		sprAttackGalaxiaDownThrustEnd: undefined,
		sprAttackGalaxiaMachTornado: undefined,
		
		sprAttackBuzzcutSlash1: undefined,
		sprAttackBuzzcutSlash2: undefined
	});
	#endregion
	#endregion
}