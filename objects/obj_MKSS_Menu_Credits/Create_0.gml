///@description Create

#region Music
scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "credits"]);
#endregion

#region Credits Names
var i = 0;
creditsNames[i] = "    The Credits";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "Meta Knightmare";
i += 1;
creditsNames[i] = "   Stellar Symphony";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = " Director";
i += 1;
creditsNames[i] = "  Chief Programmer";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "      [spr_MKSS_Menu_Credits_Icon_Strimp] Strimp";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = " Programmers";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "       [spr_MKSS_Menu_Credits_Icon_WaddleDev] WaddleDev";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "       [spr_MKSS_Menu_Credits_Icon_Jammy] Jammy";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = " Art Designers";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "       [spr_MKSS_Menu_Credits_Icon_Subsandwich] Subsandwich";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "       [spr_MKSS_Menu_Credits_Icon_SideLineGames] SideLineGames";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "       [spr_MKSS_Menu_Credits_Icon_Diamond] Diamond";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "       [spr_MKSS_Menu_Credits_Icon_BlooBird] BlooBird";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "       [spr_MKSS_Menu_Credits_Icon_Maxuwl] Maxuwl";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "       [spr_MKSS_Menu_Credits_Icon_Zuperzach] zuperzach";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "       [spr_MKSS_Menu_Credits_Icon_Jaozin] Jaozin";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "       [spr_MKSS_Menu_Credits_Icon_GoraMonk] GoraMonk";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = " Side Writer";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "       [spr_MKSS_Menu_Credits_Icon_ShadowKingSonic] ShadowKingSonic";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "  Wiki Moderator";
i += 1;
creditsNames[i] = " Tile Manager";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "       [spr_MKSS_Menu_Credits_Icon_Herbissan] Herbissan";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = " Music";
i += 1;
creditsNames[i] = "";
i += 1;
for (var h = 0; h < ds_map_size(global.MKSS_MusicIDs); h++)
{
	if (global.MKSS_MusicList[h].isUnlocked)
	{
		creditsNames[i] = "  " + string(global.MKSS_MusicList[h].name);
		i += 1;
		creditsNames[i] = "     " + string(global.MKSS_MusicList[h].author);
		i += 1;
		creditsNames[i] = "";
		i += 1;
	}
}
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = " Additional Assets From";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "  Kirby";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "  Binding of Isaac Repentance";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "  yamalpaca";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "  Terraria";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = " Special Thanks";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "       Derpyroot";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "       Shinton";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = " All Rights of Kirby";
i += 1;
creditsNames[i] = " Belong to";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = " HAL Laboratory,Inc";
i += 1;
creditsNames[i] = "    And Nintendo";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "Meta Knightmare";
i += 1;
creditsNames[i] = "   Stellar Symphony";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = " From";
i += 1;
creditsNames[i] = "   Strimp's Kitchen";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = " Created With";
i += 1;
creditsNames[i] = "  GameMaker";
i += 1;
creditsNames[i] = "   And StarDream";
i += 1;
creditsNames[i] = "    Framework";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = " Thank You For";
i += 1;
creditsNames[i] = "";
i += 1;
creditsNames[i] = "           Playing.";
i += 1;
#endregion

#region Initialize Variables
#region Component Setup
scr_Component_ButtonInputTimer_Setup(5);
#endregion

#region Menu Variables
playerNum = 0;

yStart = 160;
yScroll = 0;
scrollTimerMax = 4;
scrollTimer = scrollTimerMax;

endTimer = ((((array_length(creditsNames) + 2) * 16)) * scrollTimerMax);

exitTimer = -1;
exitTimerMax = 150;
#endregion
#endregion

#region Create Background
if (!instance_exists(obj_MKSS_Surface_Space)) instance_create_depth(0,0,0,obj_MKSS_Surface_Space);

with (instance_create_depth(0,0,depth + 100,obj_MKSS_SurfaceDrawer))
{
	targetObject = obj_MKSS_Surface_Space;
}
#endregion