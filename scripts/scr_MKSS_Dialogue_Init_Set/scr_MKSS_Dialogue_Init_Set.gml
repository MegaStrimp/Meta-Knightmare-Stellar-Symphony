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
			textSound: snd_MKSS_Dialogue_OilWheelie
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait,
			text: "If it weren't for your [#591F37]tasty benefits[/color], I wouldn't stand another second powering your airship.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait,
			text: "...[delay,500]Boss.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("oilWheelie_Halberd_1",dialogue);
	#endregion
	
	#region Halberd 2
	var dialogue = 
	[
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait,
			text: "You want me to say it again, boss?",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait,
			text: "Well, if you insist- [wave]ahem...[/wave]",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait,
			text: "This motor oil is [shake]TIGHT![/shake]",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait,
			text: "[shake]TIGHT TIGHT TIGHT![/shake]",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait,
			text: "Everyone loves that catchphrase,[delay,200] and I love your [#591F37]oil[/color]!",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait,
			text: "A little [#591F37]grease[/color] to keep the wheels spinning!",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("oilWheelie_Halberd_2",dialogue);
	#endregion
	
	#region Halberd 3
	var dialogue = 
	[
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait,
			text: "This motor oil is [shake]tight![/shake]...",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait,
			text: "Hey[delay,200] don't give me that look,[delay,200] it's my iconic catchphrase![delay,500] Everyone loves it!",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie
		},
		{
			portrait_Idle: spr_MKSS_NPC_OilWheelie_Portrait,
			portrait_Talk: spr_MKSS_NPC_OilWheelie_Portrait,
			text: "In fact, some people have even tried to STEAL IT and SAY IT ELSEWHERE![delay,500] They can't DO that![delay,500] It's MY catchphrase,[delay,500] MINE!",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_OilWheelie
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
	
	#region Javelin Knight
	#region Halberd 1
	var dialogue = 
	[
		{
			portrait_Idle: spr_MKSS_NPC_JavelinKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_JavelinKnight_Portrait_Talk,
			text: "Hey master, good to see you back.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound
		},
		{
			portrait_Idle: spr_MKSS_NPC_JavelinKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_JavelinKnight_Portrait_Talk,
			text: "We ran out of target dummies so the Captain told me to always keep some junk ready for practice.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound
		},
		{
			portrait_Idle: spr_MKSS_NPC_JavelinKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_JavelinKnight_Portrait_Talk,
			text: "Why not balloons, of course! Colorful and perfect to get a satisfying hit.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound
		},
		{
			portrait_Idle: spr_MKSS_NPC_JavelinKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_JavelinKnight_Portrait_Talk,
			text: "Not as durable but leave the thinking and blowing to me.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound
		},
		{
			portrait_Idle: spr_MKSS_NPC_JavelinKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_JavelinKnight_Portrait_Talk,
			text: "Mr. Sandbag? Yeah he's still there in the storage. You can play with him if you wish to.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound
		},
		{
			portrait_Idle: spr_MKSS_NPC_JavelinKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_JavelinKnight_Portrait_Talk,
			text: "Right through that door past the balloons.",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound
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
			text: "What, who are these 'others?' Oh, they know who they are.",
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
			text: "You found me.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "Interesting how the smallest of things can grow[delay,500] larger than the Earth",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "if you give them enough of a push",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "and[delay,500] passion.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "Do you know this place?",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "Do you[delay,500] remember[delay,500] this place?",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "I certainly do-",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "a fragment from my halcyon days.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "It also started off small;[delay,500] now we are all here.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "I am happy that we are here at this very moment.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Strimp
		},
		{
			portrait_Idle: spr_MKSS_NPC_Strimp_Portrait,
			portrait_Talk: spr_MKSS_NPC_Strimp_Portrait,
			text: "But does the butterfly remember it all?",
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
			text: "You may leave now.[delay,500] There are plenty of adventures to have.",
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
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			text: "Intruder.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Nimbia
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "Are you the one corrupting Castle Dedede?",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "Show yourself!",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight
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
			textSound: snd_MKSS_Dialogue_Nimbia
		},
		{
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			text: "Stellar Delusions only bring forth what already exists in your mind.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Nimbia
		},
		{
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			text: "Yet,[delay,200] you have managed to overcome the effects... and even used the cards to your advantage.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Nimbia
		},
		{
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			text: "With that fancy new sword you've made just now.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Nimbia
		},
		{
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Ominous1,
			text: "You have caught his attention.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Nimbia
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "'Stellar Delusions'...",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "Am I manifesting all of this?",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "Everything still resembles reality...",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight
		},
		{
			portrait_Idle: spr_MKSS_NPC_MetaKnight_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_MetaKnight_Portrait_Talk,
			text: "I must act wisely and stay calm[delay,200] before I create something dangerous.",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_MetaKnight
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
			textSound: snd_MKSS_Dialogue_Nimbia
		},
		{
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Ominous2,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Ominous2,
			text: "So[delay,200] tell me,",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Nimbia
		},
		{
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Ominous2,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Ominous2,
			text: "Will you face me like the true warrior you are meant to be...",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Nimbia
		},
		{
			portrait_Idle: spr_MKSS_NPC_Nimbia_Portrait_Idle,
			portrait_Talk: spr_MKSS_NPC_Nimbia_Portrait_Talk,
			text: "...Or will you leave that sword behind, like a coward?",
			textSpeed: defaultTextSpeed,
			textSound: snd_MKSS_Dialogue_Nimbia
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("nimbia_PreBoss_3",dialogue);
	#endregion
	#endregion
	
	#region Shadow King Sonic Borb
	var dialogue = 
	[
		{
			portrait_Idle: undefined,
			portrait_Talk: undefined,
			text: "Hello?  Hello hello?!  Can anyone hear me?!  Great, just great.  This is the thanks I get for writing all this dialogue?  I don't even get my own freaking dev room?!  Maaaaan, this sucks.  Oh well, at least I can call the others out!  First off, I'd just like to say",
			textSpeed: defaultTextSpeed,
			textSound: defaultTextSound
		}
	]
	
	scr_MKSS_Dialogue_Init_Add("shadowKingSonicBorb",dialogue);
	#endregion
	#endregion
}