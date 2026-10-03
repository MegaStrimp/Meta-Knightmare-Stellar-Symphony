///@description DL1 - Set Enemies

function scr_DL1_SetEnemies()
{
	#region Setup
	global.DL1_EnemyList = [];
	global.DL1_EnemyIDs = ds_map_create();
	#endregion
	
	#region Enemies
	scr_DL1_AddEnemy("waddleDee");
	scr_DL1_AddEnemy("cappy");
	scr_DL1_AddEnemy("brontoBurt");
	scr_DL1_AddEnemy("twizzy");
	scr_DL1_AddEnemy("poppyBrosJr");
	scr_DL1_AddEnemy("grizzo");
	scr_DL1_AddEnemy("apple");
	scr_DL1_AddEnemy("broomHatter");
	scr_DL1_AddEnemy("booler");
	scr_DL1_AddEnemy("shotzo");
	scr_DL1_AddEnemy("flapper");
	scr_DL1_AddEnemy("waddleDoo");
	scr_DL1_AddEnemy("glunk");
	scr_DL1_AddEnemy("gordo");
	scr_DL1_AddEnemy("twoFace");
	scr_DL1_AddEnemy("chuckie");
	scr_DL1_AddEnemy("mumbies");
	scr_DL1_AddEnemy("squishy");
	scr_DL1_AddEnemy("wizzer");
	scr_DL1_AddEnemy("coconut");
	scr_DL1_AddEnemy("blipper");
	scr_DL1_AddEnemy("kabu");
	scr_DL1_AddEnemy("coner");
	scr_DL1_AddEnemy("dizzy");
	scr_DL1_AddEnemy("scarfy");
	scr_DL1_AddEnemy("kookler");
	scr_DL1_AddEnemy("puffy");
	scr_DL1_AddEnemy("parasol");
	scr_DL1_AddEnemy("sirKibble");
	scr_DL1_AddEnemy("blopper");
	scr_DL1_AddEnemy("tookey");
	scr_DL1_AddEnemy("koozer");
	scr_DL1_AddEnemy("gaspar");
	scr_DL1_AddEnemy("blatzy");
	scr_DL1_AddEnemy("mrPUmpkin");
	scr_DL1_AddEnemy("hurly");
	scr_DL1_AddEnemy("skuller");
	scr_DL1_AddEnemy("flotzo");
	scr_DL1_AddEnemy("peezer");
	scr_DL1_AddEnemy("grumples");
	scr_DL1_AddEnemy("benny");
	scr_DL1_AddEnemy("whiskers");
	scr_DL1_AddEnemy("cawcun");
	scr_DL1_AddEnemy("boomer");
	
	scr_DL1_AddEnemy("poppyBrosSr");
	scr_DL1_AddEnemy("whispyWoods");
	scr_DL1_AddEnemy("lololo");
	scr_DL1_AddEnemy("lalala");
	scr_DL1_AddEnemy("lololoLalalaController");
	scr_DL1_AddEnemy("kaboola");
	scr_DL1_AddEnemy("krackoJr");
	scr_DL1_AddEnemy("kracko");
	scr_DL1_AddEnemy("kingDedede");
	scr_DL1_AddEnemy("darkInterloper");
	#endregion
}