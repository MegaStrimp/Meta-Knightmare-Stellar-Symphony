///@description Creation Code

#region Go To Next Room
var targetRoom = rm_MKSS_Menu_DisclaimerScreen;

if (global.debug)
{
	room_goto(targetRoom);
}
else
{
	scr_AlivelInstaller_Setup("https://github.com/MegaStrimp/Meta-Knightmare-Stellar-Symphony/releases/latest/download/MetaKnightmareStellarSymphony.zip",
	"https://raw.githubusercontent.com/MegaStrimp/Meta-Knightmare-Stellar-Symphony/refs/heads/main/version",
	"Meta Knightmare Stellar Symphony.exe",
	targetRoom);
}
#endregion