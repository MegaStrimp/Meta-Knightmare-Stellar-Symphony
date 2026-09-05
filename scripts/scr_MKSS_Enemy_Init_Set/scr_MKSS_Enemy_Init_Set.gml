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
				1
			],
	        [
				spr_MKSS_Enemy_BrontoBurt_Base_Hurt2,
				1
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
				1
			],
	        [
				spr_MKSS_Enemy_GhostKnight_Base_Hurt2,
				1
			],
	        [
				spr_MKSS_Enemy_GhostKnight_Base_Hurt3,
				1
			],
	        [
				spr_MKSS_Enemy_GhostKnight_Base_Hurt4,
				1
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
				1
			],
	        [
				spr_MKSS_Enemy_Peezer_Base_Hurt2,
				1
			],
	        [
				spr_MKSS_Enemy_Peezer_Base_Hurt3,
				1
			],
	        [
				spr_MKSS_Enemy_Peezer_Base_Hurt4,
				1
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
				1
			]
	    ],
		
	    sprHurtList_Naked:
		[
	        [
				spr_MKSS_Enemy_Trappy_Base_Hurt2,
				1
			],
	        [
				spr_MKSS_Enemy_Trappy_Base_Hurt3,
				1
			],
	        [
				spr_MKSS_Enemy_Trappy_Base_Hurt4,
				1
			],
	        [
				spr_MKSS_Enemy_Trappy_Base_Hurt5,
				1
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
				1
			],
	        [
				spr_MKSS_Enemy_Rango_Base_Hurt2,
				1
			],
	        [
				spr_MKSS_Enemy_Rango_Base_Hurt3,
				1
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Ghoul Knight
	var targetMappedID = scr_MKSS_Enemy_Init_Add("ghoulKnight","Ghoul Knight");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprIdle: spr_MKSS_Enemy_GhoulKnight_Base_Idle,
		sprWalk: spr_MKSS_Enemy_GhoulKnight_Base_Walk,
		sprAttackReady: spr_MKSS_Enemy_GhoulKnight_Base_AttackReady,
		sprAttack: spr_MKSS_Enemy_GhoulKnight_Base_Attack,
		sprShieldReady: spr_MKSS_Enemy_GhoulKnight_Base_ShieldReady,
		sprGuard: spr_MKSS_Enemy_GhoulKnight_Base_Guard,
		
		sprHurt1: spr_MKSS_Enemy_GhoulKnight_Base_Hurt1,
		sprHurt2: spr_MKSS_Enemy_GhoulKnight_Base_Hurt2,
		sprHurt3: spr_MKSS_Enemy_GhoulKnight_Base_Hurt3,
		sprHurt4: spr_MKSS_Enemy_GhoulKnight_Base_Hurt4,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_GhoulKnight_Base_Hurt1,
				1
			],
	        [
				spr_MKSS_Enemy_GhoulKnight_Base_Hurt2,
				1
			],
	        [
				spr_MKSS_Enemy_GhoulKnight_Base_Hurt3,
				1
			],
	        [
				spr_MKSS_Enemy_GhoulKnight_Base_Hurt4,
				1
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Wormiller
	var targetMappedID = scr_MKSS_Enemy_Init_Add("wormiller","Wormiller");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprIdle: spr_MKSS_Enemy_Wormiller_Base_Idle,
		sprScoot: spr_MKSS_Enemy_Wormiller_Base_Scoot,
		sprBounce: spr_MKSS_Enemy_Wormiller_Base_Bounce,
		sprCling1: spr_MKSS_Enemy_Wormiller_Base_Cling1,
		sprCling2: spr_MKSS_Enemy_Wormiller_Base_Cling2,
		sprCling3: spr_MKSS_Enemy_Wormiller_Base_Cling3,
		
		sprHurt1: spr_MKSS_Enemy_Wormiller_Base_Hurt1,
		sprHurt2: spr_MKSS_Enemy_Wormiller_Base_Hurt2,
		sprHurt3: spr_MKSS_Enemy_Wormiller_Base_Hurt3,
		sprHurt4: spr_MKSS_Enemy_Wormiller_Base_Hurt4,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_Wormiller_Base_Hurt1,
				1
			],
	        [
				spr_MKSS_Enemy_Wormiller_Base_Hurt2,
				1
			],
	        [
				spr_MKSS_Enemy_Wormiller_Base_Hurt3,
				1
			],
	        [
				spr_MKSS_Enemy_Wormiller_Base_Hurt4,
				1
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
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_MrSandbag_Base_Hurt1,
				1
			],
	        [
				spr_MKSS_Enemy_MrSandbag_Base_Hurt2,
				1
			]
	    ],
		
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
		sprTurnL: spr_MKSS_Enemy_Keke_Base_TurnL,
		sprTurnR: spr_MKSS_Enemy_Keke_Base_TurnR,
		sprAttackReady: spr_MKSS_Enemy_Keke_Base_AttackReady,
		sprAttack: spr_MKSS_Enemy_Keke_Base_Attack,
		sprAttackEnd: spr_MKSS_Enemy_Keke_Base_AttackEnd,
		sprBroom: spr_MKSS_Enemy_Keke_Base_Broom,
		
		sprHurt1: spr_MKSS_Enemy_Keke_Base_Hurt1,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_Keke_Base_Hurt1,
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
	
	#region Waddle Doo
	var targetMappedID = scr_MKSS_Enemy_Init_Add("waddleDoo","Waddle Doo");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprIdle: spr_MKSS_Enemy_WaddleDoo_Base_Idle,
		sprWalk: spr_MKSS_Enemy_WaddleDoo_Base_Walk,
		sprSlide: spr_MKSS_Enemy_WaddleDoo_Base_Slide,
		sprSwing: spr_MKSS_Enemy_WaddleDoo_Base_Swing,
		sprAttackReady: spr_MKSS_Enemy_WaddleDoo_Base_AttackReady,
		sprAttack: spr_MKSS_Enemy_WaddleDoo_Base_Attack,
		
		sprHurt1: spr_MKSS_Enemy_WaddleDoo_Base_Hurt1,
		sprHurt2: spr_MKSS_Enemy_WaddleDoo_Base_Hurt2,
		sprHurt3: spr_MKSS_Enemy_WaddleDoo_Base_Hurt3,
		sprHurt4: spr_MKSS_Enemy_WaddleDoo_Base_Hurt4,
		sprHurt5: spr_MKSS_Enemy_WaddleDoo_Base_Hurt5,
		sprHurt6: spr_MKSS_Enemy_WaddleDoo_Base_Hurt6,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_WaddleDoo_Base_Hurt1,
				10
			],
	        [
				spr_MKSS_Enemy_WaddleDoo_Base_Hurt2,
				10
			],
	        [
				spr_MKSS_Enemy_WaddleDoo_Base_Hurt3,
				10
			],
	        [
				spr_MKSS_Enemy_WaddleDoo_Base_Hurt4,
				10
			],
	        [
				spr_MKSS_Enemy_WaddleDoo_Base_Hurt5,
				10
			],
	        [
				spr_MKSS_Enemy_WaddleDoo_Base_Hurt6,
				1
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Wheelie
	var targetMappedID = scr_MKSS_Enemy_Init_Add("wheelie","Wheelie");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprWalk: spr_MKSS_Enemy_Wheelie_Base_Walk,
		sprTurn: spr_MKSS_Enemy_Wheelie_Base_Turn,
		
		sprHurt1: spr_MKSS_Enemy_Wheelie_Base_Hurt1,
		sprHurt2: spr_MKSS_Enemy_Wheelie_Base_Hurt2,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_Wheelie_Base_Hurt1,
				1
			],
	        [
				spr_MKSS_Enemy_Wheelie_Base_Hurt2,
				1
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Dizzy
	var targetMappedID = scr_MKSS_Enemy_Init_Add("dizzy","Dizzy");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprIdle: spr_MKSS_Enemy_Dizzy_Base_Idle,
		sprSpin: spr_MKSS_Enemy_Dizzy_Base_Spin,
		sprSpot: spr_MKSS_Enemy_Dizzy_Base_Spot,
		sprJump: spr_MKSS_Enemy_Dizzy_Base_Jump,
		sprAttackReady: spr_MKSS_Enemy_Dizzy_Base_AttackReady,
		sprAttack: spr_MKSS_Enemy_Dizzy_Base_Attack,
		
		sprHurt1: spr_MKSS_Enemy_Dizzy_Base_Hurt1,
		sprHurt2: spr_MKSS_Enemy_Dizzy_Base_Hurt2,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_Dizzy_Base_Hurt1,
				1
			],
	        [
				spr_MKSS_Enemy_Dizzy_Base_Hurt2,
				1
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Bouncy Sis
	var targetMappedID = scr_MKSS_Enemy_Init_Add("bouncySis","Bouncy Sis");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprBounceReady: spr_MKSS_Enemy_BouncySis_Base_BounceReady,
		sprBounce: spr_MKSS_Enemy_BouncySis_Base_Bounce,
		sprSpinJump: spr_MKSS_Enemy_BouncySis_Base_SpinJump,
		
		sprHurt1: spr_MKSS_Enemy_BouncySis_Base_Hurt1,
		sprHurt2: spr_MKSS_Enemy_BouncySis_Base_Hurt2,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_BouncySis_Base_Hurt1,
				1
			],
	        [
				spr_MKSS_Enemy_BouncySis_Base_Hurt2,
				1
			]
	    ],
		
		maskIndex: spr_24x24Mask_BottomOrigin
	});
	#endregion
	
	#region Chunky Dee
	var targetMappedID = scr_MKSS_Enemy_Init_Add("chunkyDee","Chunky Dee");
	
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
		
		maskIndex: spr_24x24Mask_BottomOrigin
	});
	#endregion
	
	#region Gigant Edge
	var targetMappedID = scr_MKSS_Enemy_Init_Add("gigantEdge","Gigant Edge");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprIdle: spr_MKSS_Enemy_GigantEdge_Base_Idle,
		sprWalk: spr_MKSS_Enemy_GigantEdge_Base_Walk,
		sprDuck: spr_MKSS_Enemy_GigantEdge_Base_Duck,
		
		sprSwordSwingPrepare: spr_MKSS_Enemy_GigantEdge_Base_SwordSwingPrepare,
		sprSwordSwing: spr_MKSS_Enemy_GigantEdge_Base_SwordSwing,
		
		sprSwordDash: spr_MKSS_Enemy_GigantEdge_Base_SwordDash,
		
		sprSwordSlam: spr_MKSS_Enemy_GigantEdge_Base_SwordSlam,
		
		sprChargeSwingPrepare: spr_MKSS_Enemy_GigantEdge_Base_ChargeSwingPrepare,
		
		sprSwordThrowPrepare: spr_MKSS_Enemy_GigantEdge_Base_SwordThrowPrepare,
		sprSwordThrow: spr_MKSS_Enemy_GigantEdge_Base_SwordThrow,
		
		sprShieldUp: spr_MKSS_Enemy_GigantEdge_Base_ShieldUp,
		
		sprHurt1: spr_MKSS_Enemy_GigantEdge_Base_Idle,
		sprHurt2: spr_MKSS_Enemy_GigantEdge_Base_Idle,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_GigantEdge_Base_Idle,
				1
			],
	        [
				spr_MKSS_Enemy_GigantEdge_Base_Idle,
				1
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Grand Wheelie
	var targetMappedID = scr_MKSS_Enemy_Init_Add("grandWheelie","Grand Wheelie");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprWalk: spr_MKSS_Enemy_GrandWheelie_Base_Walk,
		sprTurn: spr_MKSS_Enemy_GrandWheelie_Base_Turn,
		sprLayDown: spr_MKSS_Enemy_GrandWheelie_Base_LayDown,
		
		sprHurt1: spr_MKSS_Enemy_GrandWheelie_Base_Hurt1,
		sprHurt2: spr_MKSS_Enemy_GrandWheelie_Base_Hurt2,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_GrandWheelie_Base_Hurt1,
				1
			],
	        [
				spr_MKSS_Enemy_GrandWheelie_Base_Hurt2,
				1
			]
	    ],
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	#endregion
	
	#region Chasse-Emee
	var targetMappedID = scr_MKSS_Enemy_Init_Add("chasseEmee","Chasse-Emee");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprIntro: spr_MKSS_Enemy_ChasseEmee_Base_Intro,
		
		sprIdle: spr_MKSS_Enemy_ChasseEmee_Base_Idle,
		sprDuck: spr_MKSS_Enemy_ChasseEmee_Base_Duck,
		
		sprDash1: spr_MKSS_Enemy_ChasseEmee_Base_Dash1,
		
		sprLookDown: spr_MKSS_Enemy_ChasseEmee_Base_LookDown,
		
		sprThrust1: spr_MKSS_Enemy_ChasseEmee_Base_Thrust1,
		
		sprClawLaunch: spr_MKSS_Enemy_ChasseEmee_Base_ClawLaunch,
		
		sprUltraSwordPrepare: spr_MKSS_Enemy_ChasseEmee_Base_UltraSwordPrepare,
		sprUltraSwordSwing: spr_MKSS_Enemy_ChasseEmee_Base_UltraSwordSwing,
		
		sprShake: spr_MKSS_Enemy_ChasseEmee_Base_Shake,
		
		sprSpitPrepare: spr_MKSS_Enemy_ChasseEmee_Base_SpitPrepare,
		sprSpit: spr_MKSS_Enemy_ChasseEmee_Base_Spit,
		
		
		sprShipNormal: spr_MKSS_Enemy_ChasseEmee_Base_BackShip,
		sprShipBackground: spr_MKSS_BgEnv_ChasseShip_Idle,
		sprShipBackgroundAppear: spr_MKSS_BgEnv_ChasseShip_Appear,
		
		maskIndexDefault: spr_16x16Mask_MiddleOrigin,
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	
	scr_MKSS_Enemy_Init_Add_EnemyHealthbar(targetMappedID,scr_MKSS_Hud_EnemyHealthbar_Starless);
	#endregion
	
	#region Nimbia
	var targetMappedID = scr_MKSS_Enemy_Init_Add("nimbia","Nimbia");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprIdle: spr_MKSS_Enemy_Nimbia_Base_Idle,
		
		sprDuck: spr_MKSS_Enemy_Nimbia_Base_Duck,
		sprJump: spr_MKSS_Enemy_Nimbia_Base_Jump,
		
		sprSlashPrepare1: spr_MKSS_Enemy_Nimbia_Base_SlashPrepare1,
		sprSlashPrepare2: spr_MKSS_Enemy_Nimbia_Base_SlashPrepare2,
		sprSlashPrepare3: spr_MKSS_Enemy_Nimbia_Base_SlashPrepare3,
		
		sprSlash1: spr_MKSS_Enemy_Nimbia_Base_Slash1,
		sprSlash2: spr_MKSS_Enemy_Nimbia_Base_Slash2,
		sprSlash3: spr_MKSS_Enemy_Nimbia_Base_Slash3,
		sprSlash4: spr_MKSS_Enemy_Nimbia_Base_Slash4,
		
		sprThrustPrepare1: spr_MKSS_Enemy_Nimbia_Base_ThrustPrepare1,
		sprThrustPrepare2: spr_MKSS_Enemy_Nimbia_Base_ThrustPrepare2,
		sprThrustPrepare3: spr_MKSS_Enemy_Nimbia_Base_ThrustPrepare2,
		sprThrust1: spr_MKSS_Enemy_Nimbia_Base_Thrust1,
		sprDownThrust1: spr_MKSS_Enemy_Nimbia_Base_DownThrust1,
		
		sprSwordThrow1: spr_MKSS_Enemy_Nimbia_Base_SwordThrow1,
		sprSwordThrow2: spr_MKSS_Enemy_Nimbia_Base_SwordThrow2,
		sprSwordCatch1: spr_MKSS_Enemy_Nimbia_Base_SwordCatch1,
		sprSwordCatch2: spr_MKSS_Enemy_Nimbia_Base_SwordCatch2,
		
		sprLightningStrikePrepare1: spr_MKSS_Enemy_Nimbia_Base_LightningStrikePrepare1,
		sprLightningStrike1: spr_MKSS_Enemy_Nimbia_Base_LightningStrike1,
		
		sprKrackoForm: spr_MKSS_Enemy_Nimbia_Base_KrackoForm,
		
		sprSwordForm: spr_MKSS_Enemy_Nimbia_Base_SwordForm,
		
		sprRaijinForm: spr_MKSS_Enemy_Nimbia_Base_RaijinForm,
		
		sprTornado: spr_MKSS_Enemy_Nimbia_Base_Tornado,
		
		maskIndexDefault: spr_16x16Mask_MiddleOrigin,
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	
	scr_MKSS_Enemy_Init_Add_EnemyHealthbar(targetMappedID,scr_MKSS_Hud_EnemyHealthbar_Starless);
	#endregion
	
	#region Andromeda 1
	var targetMappedID = scr_MKSS_Enemy_Init_Add("andromeda1","Andromeda");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprIdle: spr_MKSS_Enemy_Andromeda1_Idle,
		
		sprTail_Idle: spr_MKSS_Enemy_Andromeda1_Tail_Idle,
		
		sprCape_Idle: spr_MKSS_Enemy_Andromeda1_Cape_Idle,
		
		sprArmLB_Idle: spr_MKSS_Enemy_Andromeda1_Arm_LB_Idle,
		
		sprArmRB_Idle: spr_MKSS_Enemy_Andromeda1_Arm_RB_Idle,
		
		sprArmLT_Idle: spr_MKSS_Enemy_Andromeda1_Arm_LT_Idle,
		
		sprArmRT_Idle: spr_MKSS_Enemy_Andromeda1_Arm_RT_Idle,
		
		maskIndexDefault: spr_16x16Mask_MiddleOrigin,
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	
	scr_MKSS_Enemy_Init_Add_EnemyHealthbar(targetMappedID,scr_MKSS_Hud_EnemyHealthbar_Starless);
	#endregion
	
	#region Starless Nightmare
	var targetMappedID = scr_MKSS_Enemy_Init_Add("starlessNightmare","Starless Nightmare");
	
	scr_MKSS_Enemy_Init_Add_SpriteSet(targetMappedID,
	{
		sprOrbIdle: spr_MKSS_Enemy_StarlessNightmare_Base_Orb_Idle,
		sprOrbGrow: spr_MKSS_Enemy_StarlessNightmare_Base_Orb_Grow,
		sprOrbHurt: spr_MKSS_Enemy_StarlessNightmare_Base_Orb_Hurt,
		
		sprWizardIdle: spr_MKSS_Enemy_StarlessNightmare_Base_Wizard_Idle,
		
		maskIndex: spr_16x16Mask_MiddleOrigin
	});
	
	scr_MKSS_Enemy_Init_Add_EnemyHealthbar(targetMappedID,scr_MKSS_Hud_EnemyHealthbar_Starless);
	#endregion
	
	#region Starless Marx
	var targetMappedID = scr_MKSS_Enemy_Init_Add("starlessMarx","Starless Marx");
	
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
		sprSplitEnd: spr_MKSS_Enemy_StarlessMarx_Base_SplitEnd,
		
		sprHurt1: spr_MKSS_Enemy_StarlessMarx_Base_Hurt1,
		
	    sprHurtList:
		[
	        [
				spr_MKSS_Enemy_StarlessMarx_Base_Hurt1,
				1
			]
	    ],
		
		maskIndex: spr_32x32Mask_MiddleOrigin
	});
	
	scr_MKSS_Enemy_Init_Add_EnemyHealthbar(targetMappedID,scr_MKSS_Hud_EnemyHealthbar_Starless);
	#endregion
	
	#region Starless Minimarx
	var targetMappedID = scr_MKSS_Enemy_Init_Add("starlessMinimarx","S. Minimarx");
	
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
	#endregion
}