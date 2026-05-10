///@description MKSS - Enemy - Init - Set

function scr_MKSS_Enemy_Init_Set()
{
	#region Setup
	global.MKSS_EnemyList = [];
	global.MKSS_EnemyIDs = ds_map_create();
	#endregion
	
	#region Enemies
	#region Waddle Dee
	var targetMappedID = scr_MKSS_Enemy_Init_Add("waddleDee","Waddle Dee");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprIdle: spr_MKSS_Enemy_WaddleDee_Base_Idle,
		sprWalk: spr_MKSS_Enemy_WaddleDee_Base_Walk,
		sprSlide: spr_MKSS_Enemy_WaddleDee_Base_Slide,
		sprSwing: spr_MKSS_Enemy_WaddleDee_Base_Swing,
		sprAttackReady: spr_MKSS_Enemy_WaddleDee_Base_AttackReady,
		sprAttack: spr_MKSS_Enemy_WaddleDee_Base_Attack,
		sprAttackEnd: spr_MKSS_Enemy_WaddleDee_Base_AttackEnd,
		sprTired: spr_MKSS_Enemy_WaddleDee_Base_Tired,
		sprSleep: spr_MKSS_Enemy_WaddleDee_Base_Sleep,
		
		sprHurt1: spr_MKSS_Enemy_WaddleDee_Base_Hurt1,
		sprHurt2: spr_MKSS_Enemy_WaddleDee_Base_Hurt2,
		sprHurt3: spr_MKSS_Enemy_WaddleDee_Base_Hurt3,
		sprHurt4: spr_MKSS_Enemy_WaddleDee_Base_Hurt4,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_WaddleDee_Base_Hurt1,
				10
			],
	        [
				spr_MKSS_Enemy_WaddleDee_Base_Hurt2,
				10
			],
	        [
				spr_MKSS_Enemy_WaddleDee_Base_Hurt3,
				10
			],
	        [
				spr_MKSS_Enemy_WaddleDee_Base_Hurt4,
				1
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Bronto Burt
	var targetMappedID = scr_MKSS_Enemy_Init_Add("brontoBurt","Bronto Burt");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprFly: spr_MKSS_Enemy_BrontoBurt_Base_Fly,
		sprHurt1: spr_MKSS_Enemy_BrontoBurt_Base_Hurt1,
		sprHurt2: spr_MKSS_Enemy_BrontoBurt_Base_Hurt2,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_BrontoBurt_Base_Hurt1,
				10
			],
	        [
				spr_MKSS_Enemy_BrontoBurt_Base_Hurt2,
				10
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Ghost Knight
	var targetMappedID = scr_MKSS_Enemy_Init_Add("ghostKnight","Ghost Knight");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprIdle: spr_MKSS_Enemy_GhostKnight_Base_Idle,
		sprWalk: spr_MKSS_Enemy_GhostKnight_Base_Walk,
		sprAttackReady: spr_MKSS_Enemy_GhostKnight_Base_AttackReady,
		sprAttack: spr_MKSS_Enemy_GhostKnight_Base_Attack,
		sprShieldReady: spr_MKSS_Enemy_GhostKnight_Base_ShieldReady,
		sprGuard: spr_MKSS_Enemy_GhostKnight_Base_Guard,
		sprHurt1: spr_MKSS_Enemy_GhostKnight_Base_Hurt1,
		sprHurt2: spr_MKSS_Enemy_GhostKnight_Base_Hurt2,
		sprHurt3: spr_MKSS_Enemy_GhostKnight_Base_Hurt3,
		sprHurt4: spr_MKSS_Enemy_GhostKnight_Base_Hurt4,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_GhostKnight_Base_Hurt1,
				10
			],
	        [
				spr_MKSS_Enemy_GhostKnight_Base_Hurt2,
				10
			],
	        [
				spr_MKSS_Enemy_GhostKnight_Base_Hurt3,
				10
			],
	        [
				spr_MKSS_Enemy_GhostKnight_Base_Hurt4,
				10
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Gordo
	var targetMappedID = scr_MKSS_Enemy_Init_Add("gordo","Gordo");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprMove: spr_MKSS_Enemy_Gordo_Base_Move,
		sprParry: spr_MKSS_Enemy_Gordo_Base_Parry,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_Gordo_Base_Move,
				1
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Peezer
	var targetMappedID = scr_MKSS_Enemy_Init_Add("peezer","Peezer");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprIdle: spr_MKSS_Enemy_Peezer_Base_Idle,
		sprWalk: spr_MKSS_Enemy_Peezer_Base_Walk,
		sprAttackStart: spr_MKSS_Enemy_Peezer_Base_AttackStart,
		sprAttack: spr_MKSS_Enemy_Peezer_Base_Attack,
		sprAttackEnd: spr_MKSS_Enemy_Peezer_Base_AttackEnd,
		sprHurt1: spr_MKSS_Enemy_Peezer_Base_Hurt1,
		sprHurt2: spr_MKSS_Enemy_Peezer_Base_Hurt2,
		sprHurt3: spr_MKSS_Enemy_Peezer_Base_Hurt3,
		sprHurt4: spr_MKSS_Enemy_Peezer_Base_Hurt4,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_Peezer_Base_Hurt1,
				10
			],
	        [
				spr_MKSS_Enemy_Peezer_Base_Hurt2,
				10
			],
	        [
				spr_MKSS_Enemy_Peezer_Base_Hurt3,
				10
			],
	        [
				spr_MKSS_Enemy_Peezer_Base_Hurt4,
				10
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Trappy
	var targetMappedID = scr_MKSS_Enemy_Init_Add("trappy","Trappy");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprIdle: spr_MKSS_Enemy_Trappy_Base_Idle,
		sprHop: spr_MKSS_Enemy_Trappy_Base_Hop,
		sprJump: spr_MKSS_Enemy_Trappy_Base_Jump,
		sprThrow: spr_MKSS_Enemy_Trappy_Base_Throw,
		sprClose: spr_MKSS_Enemy_Trappy_Base_Close,
		sprNaked: spr_MKSS_Enemy_Trappy_Base_Naked,
		sprHurt1: spr_MKSS_Enemy_Trappy_Base_Hurt1,
		sprHurt2: spr_MKSS_Enemy_Trappy_Base_Hurt2,
		sprHurt3: spr_MKSS_Enemy_Trappy_Base_Hurt3,
		sprHurt4: spr_MKSS_Enemy_Trappy_Base_Hurt4,
		sprHurt5: spr_MKSS_Enemy_Trappy_Base_Hurt5,
		
	    sprHurtList_Chest:
		[
	        [
				spr_MKSS_Enemy_Trappy_Base_Hurt1,
				10
			]
	    ],
		
	    sprHurtList_Naked:
		[
	        [
				spr_MKSS_Enemy_Trappy_Base_Hurt2,
				10
			],
	        [
				spr_MKSS_Enemy_Trappy_Base_Hurt3,
				10
			],
	        [
				spr_MKSS_Enemy_Trappy_Base_Hurt4,
				10
			],
	        [
				spr_MKSS_Enemy_Trappy_Base_Hurt5,
				10
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Rango
	var targetMappedID = scr_MKSS_Enemy_Init_Add("rango","Rango");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprIdle: spr_MKSS_Enemy_Rango_Base_Idle,
		sprSpot: spr_MKSS_Enemy_Rango_Base_Spot,
		sprAttackReady: spr_MKSS_Enemy_Rango_Base_AttackReady,
		sprAttack: spr_MKSS_Enemy_Rango_Base_Attack,
		sprFlop: spr_MKSS_Enemy_Rango_Base_Flop,
		sprFlopJump: spr_MKSS_Enemy_Rango_Base_FlopJump,
		sprHurt1: spr_MKSS_Enemy_Rango_Base_Hurt1,
		sprHurt2: spr_MKSS_Enemy_Rango_Base_Hurt2,
		sprHurt3: spr_MKSS_Enemy_Rango_Base_Hurt3,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_Rango_Base_Hurt1,
				10
			],
	        [
				spr_MKSS_Enemy_Rango_Base_Hurt2,
				10
			],
	        [
				spr_MKSS_Enemy_Rango_Base_Hurt3,
				10
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Mr. Sandbag
	var targetMappedID = scr_MKSS_Enemy_Init_Add("mrSandbag","Mr. Sandbag");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprIdle: spr_MKSS_Enemy_MrSandbag_Base_Idle,
		sprHurt1: spr_MKSS_Enemy_MrSandbag_Base_Hurt1,
		sprHurt2: spr_MKSS_Enemy_MrSandbag_Base_Hurt2,
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Bouncy
	var targetMappedID = scr_MKSS_Enemy_Init_Add("bouncy","Bouncy");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprBounceReady: spr_MKSS_Enemy_Bouncy_Base_BounceReady,
		sprBounce: spr_MKSS_Enemy_Bouncy_Base_Bounce,
		sprSpinJump: spr_MKSS_Enemy_Bouncy_Base_SpinJump,
		
		sprHurt1: spr_MKSS_Enemy_Bouncy_Base_Hurt1,
		sprHurt2: spr_MKSS_Enemy_Bouncy_Base_Hurt2,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_Bouncy_Base_Hurt1,
				1
			],
	        [
				spr_MKSS_Enemy_Bouncy_Base_Hurt2,
				1
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Baggie
	var targetMappedID = scr_MKSS_Enemy_Init_Add("baggie","Baggie");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprIdle: spr_MKSS_Enemy_Baggie_Base_Idle,
		sprSpotPlayer: spr_MKSS_Enemy_Baggie_Base_SpotPlayer,
		sprRun: spr_MKSS_Enemy_Baggie_Base_Run,
		
		sprHurt1: spr_MKSS_Enemy_Baggie_Base_Hurt1,
		sprHurt2: spr_MKSS_Enemy_Baggie_Base_Hurt2,
		sprHurt3: spr_MKSS_Enemy_Baggie_Base_Hurt3,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_Baggie_Base_Hurt1,
				3
			],
	        [
				spr_MKSS_Enemy_Baggie_Base_Hurt2,
				3
			],
	        [
				spr_MKSS_Enemy_Baggie_Base_Hurt3,
				2
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Keke
	var targetMappedID = scr_MKSS_Enemy_Init_Add("keke","Keke");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprFloat: spr_MKSS_Enemy_Keke_Base_Float,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_Keke_Base_Float,
				1
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Booler
	var targetMappedID = scr_MKSS_Enemy_Init_Add("booler","Booler");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprIdle: spr_MKSS_Enemy_Booler_Base_Idle,
		sprDuck: spr_MKSS_Enemy_Booler_Base_Duck,
		sprHurt1: spr_MKSS_Enemy_Booler_Base_Hurt1,
		sprHurt2: spr_MKSS_Enemy_Booler_Base_Hurt2,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_Booler_Base_Hurt1,
				1
			],
			[
				spr_MKSS_Enemy_Booler_Base_Hurt2,
				1
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Chunky Dee
	var targetMappedID = scr_MKSS_Enemy_Init_Add("chunkyDee","Chunky Dee");
	#endregion
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprIdle: spr_MKSS_Enemy_ChunkyDee_Base_Idle,
		sprWalk: spr_MKSS_Enemy_ChunkyDee_Base_Walk,
		sprDash: spr_MKSS_Enemy_ChunkyDee_Base_Dash,
		sprDashEnd: spr_MKSS_Enemy_ChunkyDee_Base_DashEnd,
		sprHold: spr_MKSS_Enemy_ChunkyDee_Base_Hold,
		sprThrow: spr_MKSS_Enemy_ChunkyDee_Base_Throw,
		sprJumpPrepare: spr_MKSS_Enemy_ChunkyDee_Base_JumpPrepare,
		sprJump: spr_MKSS_Enemy_ChunkyDee_Base_Jump,
		sprFall: spr_MKSS_Enemy_ChunkyDee_Base_Fall,
		sprSlam: spr_MKSS_Enemy_ChunkyDee_Base_Slam,
		
		sprHurt1: spr_MKSS_Enemy_ChunkyDee_Base_Hurt1,
		sprHurt2: spr_MKSS_Enemy_ChunkyDee_Base_Hurt2,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_ChunkyDee_Base_Hurt1,
				1
			],
	        [
				spr_MKSS_Enemy_ChunkyDee_Base_Hurt2,
				1
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Starless Nightmare
	var targetMappedID = scr_MKSS_Enemy_Init_Add("starlessNightmare","Starless Nightmare");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprOrbIdle: spr_MKSS_Enemy_StarlessNightmare_Base_Orb_Idle,
		sprOrbHurt: spr_MKSS_Enemy_StarlessNightmare_Base_Orb_Hurt
	});
	
	scr_MKSS_Enemy_Init_Add_EnemyHealthbar(targetMappedID,scr_MKSS_Hud_EnemyHealthbar_Starless);
	#endregion
	
	#region Starless Marx
	var targetMappedID = scr_MKSS_Enemy_Init_Add("starlessMarx","Starless Marx");
	#endregion
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprAppear: spr_MKSS_Enemy_StarlessMarx_Base_Appear,
		sprBallIn: spr_MKSS_Enemy_StarlessMarx_Base_BallIn,
		sprBallOut: spr_MKSS_Enemy_StarlessMarx_Base_BallOut,
		sprIntro: spr_MKSS_Enemy_StarlessMarx_Base_Intro,
		sprIdle: spr_MKSS_Enemy_StarlessMarx_Base_Idle,
		sprFly: spr_MKSS_Enemy_StarlessMarx_Base_Fly,
		sprFlyUp: spr_MKSS_Enemy_StarlessMarx_Base_FlyUp,
		sprCharge: spr_MKSS_Enemy_StarlessMarx_Base_Charge,
		sprCloseWing: spr_MKSS_Enemy_StarlessMarx_Base_CloseWing,
		sprBomb: spr_MKSS_Enemy_StarlessMarx_Base_Bomb,
		sprArrow: spr_MKSS_Enemy_StarlessMarx_Base_Arrow,
		sprLaser: spr_MKSS_Enemy_StarlessMarx_Base_Laser,
		sprSplit: spr_MKSS_Enemy_StarlessMarx_Base_Split,
		
		maskIndex: spr_32x32Mask_MiddleOrigin
	});
	
	scr_MKSS_Enemy_Init_Add_EnemyHealthbar(targetMappedID,scr_MKSS_Hud_EnemyHealthbar_Starless);
	#endregion
	
	#region Starless Minimarx
	var targetMappedID = scr_MKSS_Enemy_Init_Add("starlessMinimarx","S. Minimarx");
	#endregion
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprWalk: spr_MKSS_Enemy_StarlessMinimarx_Base_Walk,
		
		sprHurt1: spr_MKSS_Enemy_StarlessMinimarx_Base_Hurt,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_StarlessMinimarx_Base_Hurt,
				1
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
}