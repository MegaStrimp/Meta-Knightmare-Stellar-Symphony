///@description MKSS - Dialogue - Init - Set

function scr_MKSS_Dialogue_Init_Set()
{
	#region Setup
	global.MKSS_DialogueList = [];
	global.MKSS_DialogueIDs = ds_map_create();
	
	var defaultTextSpeed = .5;
	var defaultTextSound = snd_MKSS_Dialogue_Default;
	#endregion
	
	#region Dialogue
	#region Oil Wheelie
	#region Halberd 1
	var dialogue = 
	[
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait,
			text: "This motor oil is [shake]TIGHT![/shake]",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait,
			text: "If it weren't for your tasty benefits, I wouldn't stand another second powering your airship.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait,
			text: "Only in Halberd!",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("oilWheelie_Halberd_1",dialogue);
	#endregion
	#endregion
	
	#region Paint Roller
	#region Halberd 1
	var dialogue = 
	[
		{
			portrait_Idle: spr_MKSS_NPC_PaintRoller_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_PaintRoller_Portrait_Talk,
			text: "Oh hey boss! Sir! My lord?...",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound
		},
		{
			portrait_Idle: spr_MKSS_NPC_PaintRoller_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_PaintRoller_Portrait_Talk,
			text: "[shake]B-boss[/shake], yeah, yeah, I'm sticking with boss.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound
		},
		{
			portrait_Idle: spr_MKSS_NPC_PaintRoller_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_PaintRoller_Portrait_Talk,
			text: "Hey-a, [c_red]pardon [c_green]the [c_blue]mess[/color], yeah? Not sure why Axie's [spr_MKSS_Dialogue_Icon_AxeKnight] mask is in a twist.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound
		},
		{
			portrait_Idle: spr_MKSS_NPC_PaintRoller_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_PaintRoller_Portrait_Talk,
			text: "My brother in arms,[delay,200] you [shake]SAID[/shake] [wobble]'go nuts.'[/wobble] Dunno whatcha expected from telling an [rainbow]artist[/rainbow] that!",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("paintRoller_Halberd_1",dialogue);
	#endregion
	#endregion
	
	#region Captain Vul
	#region Halberd 1
	var dialogue = 
	[
		{
			portrait_Idle: spr_MKSS_NPC_PaintRoller_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_PaintRoller_Portrait_Talk,
			text: "My lord, you're looking well. I'm glad you and the other Meta-Knights don't hold, you know, THAT, against me...  But I still feel like I've heard 'chicken' thrown around from time to time. You know. From OTHERS.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound
		},
		{
			portrait_Idle: spr_MKSS_NPC_PaintRoller_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_PaintRoller_Portrait_Talk,
			text: "They could at least say 'chickenhawk'... It's still an insult, but it's at least a bit closer to reality.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound
		},
		{
			portrait_Idle: spr_MKSS_NPC_PaintRoller_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_PaintRoller_Portrait_Talk,
			text: "What, who are these 'others?'  Oh, they know who they are.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("captainVul_Halberd_1",dialogue);
	#endregion
	#endregion
	
	#region Strimp
	#region KSW 1
	var dialogue = 
	[
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "You found me",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "My name is Mega Strimp",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "herbistan",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("strimp_KSW_1",dialogue);
	#endregion
	
	#region KSW 2
	var dialogue = 
	[
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "You may leave now",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("strimp_KSW_2",dialogue);
	#endregion
	#endregion
	
	#region Nimbia
	#region Pre-Boss 1
	var dialogue = 
	[
		{
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Talk,
			text: "...Or will you leave that sword behind, like a coward?",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("nimbia_PreBoss_1",dialogue);
	#endregion
	#endregion
	#endregion
}