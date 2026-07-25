///@description MKSS - Dialogue - Init - Set

function scr_MKSS_Dialogue_Init_Set()
{
	#region Setup
	global.MKSS_DialogueList = [];
	global.MKSS_DialogueIDs = ds_map_create();
	
	var defaultTextSpeed = .35;
	var defaultTextSound = snd_MKSS_Dialogue_Default;
	var defaultDrawScript = scr_MKSS_UI_Dialogue_Draw_Default;
	#endregion
	
	#region Dialogue
	#region Oil Wheelie
	#region Halberd 1
	var dialogue = 
	[
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait_Talk,
			text: "This [" + MKSS_Base_Color_HalberdOil + "]motor oil[/color] is [shake]TIGHT![/shake]",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait_Talk,
			text: "If it weren't for your [" + MKSS_Base_Color_HalberdOil + "]tasty benefits[/color], I wouldn't stand another second powering your airship.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait_Talk,
			text: "...[delay,500]Boss.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie,
			drawScript: defaultDrawScript
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("oilWheelie_Halberd_1",dialogue);
	#endregion
	
	#region Halberd 2
	var dialogue = 
	[
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait_Talk,
			text: "You want me to say it again, boss?",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait_Talk,
			text: "Well, if you insist- [wave]ahem...[/wave]",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait_Talk,
			text: "This [" + MKSS_Base_Color_HalberdOil + "]motor oil[/color] is [shake]TIGHT![/shake]",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait_Talk,
			text: "[shake]TIGHT TIGHT TIGHT![/shake]",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait_Talk,
			text: "Everyone loves that catchphrase,[delay,200] and I love your [" + MKSS_Base_Color_HalberdOil + "]oil[/color]!",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait_Talk,
			text: "A little [" + MKSS_Base_Color_HalberdOil + "]grease[/color] to keep the wheels spinning!",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie,
			drawScript: defaultDrawScript
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("oilWheelie_Halberd_2",dialogue);
	#endregion
	
	#region Halberd 3
	var dialogue = 
	[
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait_Talk,
			text: "This [" + MKSS_Base_Color_HalberdOil + "]motor oil[/color] is [shake]TIGHT![/shake]...",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait_Talk,
			text: "Hey[delay,200] don't give me that look,[delay,200] it's my iconic catchphrase![delay,500] Everyone loves it!",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait_Talk,
			text: "In fact, some people have even tried to STEAL IT and SAY IT ELSEWHERE![delay,500] They can't DO that![delay,500] It's MY catchphrase,[delay,500] MINE!",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie,
			drawScript: defaultDrawScript
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("oilWheelie_Halberd_3",dialogue);
	#endregion
	#endregion
	
	#region Paint Roller
	#region Halberd 1
	var dialogue = 
	[
		{
			portrait_Idle: spr_MKSS_NPC_PaintRoller_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_PaintRoller_Portrait_Talk,
			text: "Oh hey boss![delay,200] Sir![delay,200] My lord?...",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_PaintRoller_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_PaintRoller_Portrait_Talk,
			text: "[shake]B-[delay,200]boss[/shake], yeah,[delay,500] yeah, I'm sticking with boss.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_PaintRoller_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_PaintRoller_Portrait_Talk,
			text: "Hey-a, [c_red]pardon [c_lime]the [c_aqua]mess[/color], yeah?[delay,500] Not sure why Axie's [spr_MKSS_Dialogue_Icon_AxeKnight] mask is in a twist.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_PaintRoller_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_PaintRoller_Portrait_Talk,
			text: "My brother in arms,[delay,200] you [shake]SAID[/shake] [wobble]'go nuts.'[/wobble] Dunno whatcha expected from telling an [rainbow]artist[/rainbow] that!",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound,
			drawScript: defaultDrawScript
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("paintRoller_Halberd_1",dialogue);
	#endregion
	#endregion
	
	#region Javelin Knight
	#region Halberd 1
	var dialogue = 
	[
		{
			portrait_Idle: spr_MKSS_NPC_JavelinKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_JavelinKnight_Portrait_Talk,
			text: "Hey master,[delay,200] good to see you back!",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_JavelinKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_JavelinKnight_Portrait_Talk,
			text: "We ran out of target dummies so the [c_yellow]Captain[/color] told me to always keep some junk ready for practice.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_JavelinKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_JavelinKnight_Portrait_Talk,
			text: "Why not balloons,[delay,200] of course![delay,500] [rainbow]Colorful[/rainbow] and perfect to get a satisfying hit.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_JavelinKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_JavelinKnight_Portrait_Talk,
			text: "Not as durable but leave the thinking and blowing to me.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_JavelinKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_JavelinKnight_Portrait_Talk,
			text: "Mr. Sandbag? Yeah he's still there in the storage. You can play with him if you wish to.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_JavelinKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_JavelinKnight_Portrait_Talk,
			text: "Right through that door past the balloons.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound,
			drawScript: defaultDrawScript
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("javelinKnight_Halberd_1",dialogue);
	#endregion
	#endregion
	
	#region Captain Vul
	#region Halberd 1
	var dialogue = 
	[
		{
			portrait_Idle: spr_MKSS_NPC_PaintRoller_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_PaintRoller_Portrait_Talk,
			text: "My lord, you're looking well. I'm glad you and the other Meta-Knights don't hold, you know, THAT, against me... But I still feel like I've heard 'chicken' thrown around from time to time. You know. From OTHERS.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_PaintRoller_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_PaintRoller_Portrait_Talk,
			text: "They could at least say 'chickenhawk'... It's still an insult, but it's at least a bit closer to reality.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_PaintRoller_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_PaintRoller_Portrait_Talk,
			text: "What, who are these 'others?' Oh, they know who they are.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound,
			drawScript: defaultDrawScript
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
			text: "You found me.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "Interesting how the smallest of things can grow[delay,500] larger than the Earth",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "if you give them enough of a push",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "and[delay,500] passion.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "Do you know this place?",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "Do you[delay,500] remember[delay,500] this place?",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "I certainly do-",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "a fragment from my halcyon days.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "It also started off small;[delay,500] now we are all here.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "I am happy that we are here at this very moment.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "But does the butterfly remember it all?",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp,
			drawScript: defaultDrawScript
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
			text: "You may leave now.[delay,500] There are plenty of adventures to have.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp,
			drawScript: defaultDrawScript
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
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			text: "Intruder.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Nimbia,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "Are you the one corrupting Castle Dedede?",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "Show yourself!",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight,
			drawScript: defaultDrawScript
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("nimbia_PreBoss_1",dialogue);
	#endregion
	
	#region Pre-Boss 2
	var dialogue = 
	[
		{
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			text: "I am but a mere guardian.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Nimbia,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			text: "[" + MKSS_Base_Color_Andromeda + "]Stellar Delusions[/color] only bring forth what already exists in your mind.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Nimbia,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			text: "Yet,[delay,200] you have managed to overcome the effects... and even used the cards to your advantage.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Nimbia,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			text: "With that fancy new sword you've made just now.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Nimbia,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			text: "You have caught his attention.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Nimbia,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "'[" + MKSS_Base_Color_Andromeda + "]Stellar Delusions[/color]'...",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "Am I manifesting all of this?",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "Everything still resembles reality...",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "I must act wisely and stay calm[delay,200] before I create something dangerous.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight,
			drawScript: defaultDrawScript
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("nimbia_PreBoss_2",dialogue);
	#endregion
	
	#region Pre-Boss 3
	var dialogue = 
	[
		{
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Ominous2,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Ominous2,
			text: "You have disappointed our expectations.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Nimbia,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Ominous2,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Ominous2,
			text: "So[delay,200] tell me,",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Nimbia,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Ominous2,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Ominous2,
			text: "Will you face me like the true warrior you are meant to be...",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Nimbia,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Talk,
			text: "...Or will you leave that sword behind, like a coward?",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Nimbia,
			drawScript: defaultDrawScript
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("nimbia_PreBoss_3",dialogue);
	#endregion
	#endregion
	
	#region Andromeda
	#region Pre-Boss 1
	var dialogue = 
	[
		{
			portrait_Idle: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			text: "Persistent creature",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Andromeda1,
			drawScript: scr_MKSS_UI_Dialogue_Draw_Andromeda
		},
		{
			portrait_Idle: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			text: "Never have I seen anyone withstanding my [" + MKSS_Base_Color_Andromeda + "]Stellar Delusions[/color] like this",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Andromeda1,
			drawScript: scr_MKSS_UI_Dialogue_Draw_Andromeda
		},
		{
			portrait_Idle: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			text: "You must be quite a warrior in your realm",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Andromeda1,
			drawScript: scr_MKSS_UI_Dialogue_Draw_Andromeda
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "So[delay,200] it is you behind this mess.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "I have defeated two of your guardians.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "Give up.[delay,500] Leave Planet Popstar.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			text: "They were sentinels given flesh by your subconscious.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Andromeda1,
			drawScript: scr_MKSS_UI_Dialogue_Draw_Andromeda
		},
		{
			portrait_Idle: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			text: "Each one represents a hotspot I have anchored to your planet.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Andromeda1,
			drawScript: scr_MKSS_UI_Dialogue_Draw_Andromeda
		},
		{
			portrait_Idle: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			text: "The closer you get to them,[delay,200] the more your mind begins to manifest fragments of itself.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Andromeda1,
			drawScript: scr_MKSS_UI_Dialogue_Draw_Andromeda
		},
		{
			portrait_Idle: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			text: "Fragments of your memories,[delay,500] pieced together to create something new.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Andromeda1,
			drawScript: scr_MKSS_UI_Dialogue_Draw_Andromeda
		},
		{
			portrait_Idle: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			text: "And I can see you have faced many dangers in your past.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Andromeda1,
			drawScript: scr_MKSS_UI_Dialogue_Draw_Andromeda
		},
		{
			portrait_Idle: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			text: "Opponents as[delay,200] honorable as you.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Andromeda1,
			drawScript: scr_MKSS_UI_Dialogue_Draw_Andromeda
		},
		{
			portrait_Idle: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_Andromeda_Portrait_Idle,
			text: "A life of rebellion has made you stronger.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Andromeda1,
			drawScript: scr_MKSS_UI_Dialogue_Draw_Andromeda
		},
		{
			portrait_Idle: spr_MKSS_NPC_Andromeda_Portrait_Ominous,
			portrait_Talk: spr_MKSS_NPC_Andromeda_Portrait_Ominous,
			text: "It must be overwhelming to go through all of that again.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Andromeda1,
			drawScript: scr_MKSS_UI_Dialogue_Draw_Andromeda
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "Your magic has done me more good than harm.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "I will never submit.[delay,500] I can face my rivals again and again,[delay,200] for none of them have defeated me.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "Not with this power.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "You are right,[delay,500] I am growing stronger.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight,
			drawScript: defaultDrawScript
		},
		{
			portrait_Idle: spr_MKSS_NPC_Andromeda_Portrait_Ominous,
			portrait_Talk: spr_MKSS_NPC_Andromeda_Portrait_Ominous,
			text: "I do not expect you to submit,[delay,200] not anymore.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Andromeda1,
			drawScript: scr_MKSS_UI_Dialogue_Draw_Andromeda
		},
		{
			portrait_Idle: spr_MKSS_NPC_Andromeda_Portrait_Ominous,
			portrait_Talk: spr_MKSS_NPC_Andromeda_Portrait_Ominous,
			text: "You are different.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Andromeda1,
			drawScript: scr_MKSS_UI_Dialogue_Draw_Andromeda
		},
		{
			portrait_Idle: spr_MKSS_NPC_Andromeda_Portrait_Scary,
			portrait_Talk: spr_MKSS_NPC_Andromeda_Portrait_Scary,
			text: "I will make sure to give you an honorable end.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Andromeda1,
			drawScript: scr_MKSS_UI_Dialogue_Draw_Andromeda
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("andromeda_PreBoss_1",dialogue);
	#endregion
	#endregion
	
	#region Shadow King Sonic Borb
	var dialogue = 
	[
		{
			portrait_Idle: undefined,
			portrait_Talk: undefined,
			text: "Hello? Hello hello?! Can anyone hear me?! Great, just great. This is the thanks I get for writing all this dialogue? I don't even get my own freaking dev room?! Maaaaan, this sucks. Oh well, at least I can call the others out! First off, I'd just like to say",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound,
			drawScript: defaultDrawScript
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("shadowKingSonicBorb",dialogue);
	#endregion
	#endregion
}