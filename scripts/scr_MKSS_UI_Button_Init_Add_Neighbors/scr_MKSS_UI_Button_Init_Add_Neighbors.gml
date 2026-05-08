///@description MKSS - UI - Button - Init - Add - Neighbors

function scr_MKSS_UI_Button_Init_Add_Neighbors(targetMappedID,targetNeighborLeft = undefined,targetNeighborRight = undefined,targetNeighborUp = undefined,targetNeighborDown = undefined)
{
	global.MKSS_ButtonList[targetMappedID].neighborLeft = targetNeighborLeft;
	global.MKSS_ButtonList[targetMappedID].neighborRight = targetNeighborRight;
	global.MKSS_ButtonList[targetMappedID].neighborUp = targetNeighborUp;
	global.MKSS_ButtonList[targetMappedID].neighborDown = targetNeighborDown;
}