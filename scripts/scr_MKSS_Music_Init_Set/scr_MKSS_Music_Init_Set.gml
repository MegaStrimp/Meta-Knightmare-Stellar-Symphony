///@description MKSS - Music - Init - Set

function scr_MKSS_Music_Init_Set()
{
	#region Setup
	global.MKSS_MusicList = [];
	global.MKSS_MusicIDs = ds_map_create();
	#endregion
	
	#region Music
	scr_MKSS_Music_Init_Add("title","Sound of Siren","Mother 3",mus_MKSS_Title);
	scr_MKSS_Music_Init_Add("iceCreamIsland","Second Wind - Sonic Mvt","Sonic Frontiers",mus_MKSS_IceCreamIsland);
	scr_MKSS_Music_Init_Add("battleshipHalberd_1","Iwatodai Dorm","Persona 3 Reload",mus_MKSS_BattleshipHalberd_1,12.996,[86.265]);
	scr_MKSS_Music_Init_Add("battleshipHalberd_2","Butterfly Kiss","Persona 5",mus_MKSS_BattleshipHalberd_2,19.063,[39.376]);
	scr_MKSS_Music_Init_Add("starryShores","It's Going Down Now","Persona 3 Reload",mus_MKSS_StarryShores);
	scr_MKSS_Music_Init_Add("starryShores_StrimpRoom","Pipo Pipo -Music Box-","Serani Poji & R3 Music Box",mus_MKSS_StarryShores_StrimpRoom);
	scr_MKSS_Music_Init_Add("royalReeve","When The Moon's Reaching Out Stars -Reload-","Persona 3 Reload",mus_MKSS_RoyalReeve,12,[139.655]);
	scr_MKSS_Music_Init_Add("livingLoom","Light the Fire Up in the Night -KAGEJIKAN-","Persona Q",mus_MKSS_LivingLoom,11.275,[67.8]);
	scr_MKSS_Music_Init_Add("fissionFactory","Bloody Destiny","Persona 1 PSP",mus_MKSS_FissionFactory,52.423,[29.5]);
	scr_MKSS_Music_Init_Add("adAstra","Full Moon Full Life","Persona 3 Reload",mus_MKSS_AdAstra,3.584,[169.23]);
	scr_MKSS_Music_Init_Add("starryShoresEX","Don't","Persona 3 Reload",mus_MKSS_StarryShoresEX);
	scr_MKSS_Music_Init_Add("royalReeveEX","Color The Night","Persona 3 Reload",mus_MKSS_RoyalReeveEX,1.294,[101.8]);
	scr_MKSS_Music_Init_Add("livingLoomEX","Light the Fire Up in the Night -MAYONAKA-","Persona Q",mus_MKSS_LivingLoomEX,11.462,[68.8]);
	scr_MKSS_Music_Init_Add("fissionFactoryEX","Pandora - Last Battle","Persona 1 PSP",mus_MKSS_FissionFactoryEX,.037,[32.98]);
	scr_MKSS_Music_Init_Add("adAstraEX","Disconnected","Persona 3 Reload",mus_MKSS_AdAstraEX,6.236,[195.188]);
	scr_MKSS_Music_Init_Add("miniboss","Master of Tartarus","Persona 3 Reload",mus_MKSS_Miniboss,43.968,[47.632]);
	scr_MKSS_Music_Init_Add("boss","Mass Destruction","Persona 3",mus_MKSS_Boss);
	scr_MKSS_Music_Init_Add("andromedaBattle_1","Self Redemption","Persona 3 The Movie",mus_MKSS_AndromedaBattle_1);		//STRIMPTODO Set Points
	scr_MKSS_Music_Init_Add("andromedaBattle_2","Ying Yang","Persona 4 The Golden Animation",mus_MKSS_AndromedaBattle_2);	//STRIMPTODO Set Points
	scr_MKSS_Music_Init_Add("starlessMarx","Vs. Marx","Kirby Air Riders",mus_MKSS_StarlessMarx);
	scr_MKSS_Music_Init_Add("stageClear","Disconnected","Persona 3 Reload",mus_MKSS_StageClear,.436);
	scr_MKSS_Music_Init_Add("crystalSpace","Deep Breath Deep Breath","Persona 3 Reload",mus_MKSS_CrystalSpace,,[17.285,34.184]);
	scr_MKSS_Music_Init_Add("arenaLobby","Let Butterflies Spread Until the Dawn","Persona 1 PSP",mus_MKSS_ArenaLobby,.613,[23.835]);
	scr_MKSS_Music_Init_Add("arenaBattle","A Lone Prayer","Persona 1 PSP",mus_MKSS_ArenaBattle,15.6,[36.050]);
	#endregion
}