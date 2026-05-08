///@description Draw End

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
#endregion

for (var i = 0; i < ds_list_size(constellationList); i++)
{
	var currentIndex = global.MKSS_UpgradeList[ds_list_find_value(constellationList,i)];
	
	draw_sprite(obj_MKSS_Menu_Upgrades_Node,0,xx + currentIndex.x + constellationOffsets[i].x,yy + currentIndex.y + constellationOffsets[i].y);
	
	if (currentIndex.neighborLeft != undefined)
	{
		var neighborIndex = global.MKSS_UpgradeList[currentIndex.neighborLeft];
		var neighborListIndex = ds_list_find_index(constellationList,currentIndex.neighborLeft);
		
		draw_line(xx + currentIndex.x + constellationOffsets[i].x,yy + currentIndex.y + constellationOffsets[i].y,xx + neighborIndex.x + constellationOffsets[neighborListIndex].x,yy + neighborIndex.y + constellationOffsets[neighborListIndex].y);
	}
	
	if (currentIndex.neighborRight != undefined)
	{
		var neighborIndex = global.MKSS_UpgradeList[currentIndex.neighborRight];
		var neighborListIndex = ds_list_find_index(constellationList,currentIndex.neighborRight);
		
		draw_line(xx + currentIndex.x + constellationOffsets[i].x,yy + currentIndex.y + constellationOffsets[i].y,xx + neighborIndex.x + constellationOffsets[neighborListIndex].x,yy + neighborIndex.y + constellationOffsets[neighborListIndex].y);
	}
	
	if (currentIndex.neighborUp != undefined)
	{
		var neighborIndex = global.MKSS_UpgradeList[currentIndex.neighborUp];
		var neighborListIndex = ds_list_find_index(constellationList,currentIndex.neighborUp);
		
		draw_line(xx + currentIndex.x + constellationOffsets[i].x,yy + currentIndex.y + constellationOffsets[i].y,xx + neighborIndex.x + constellationOffsets[neighborListIndex].x,yy + neighborIndex.y + constellationOffsets[neighborListIndex].y);
	}
	
	if (currentIndex.neighborDown != undefined)
	{
		var neighborIndex = global.MKSS_UpgradeList[currentIndex.neighborDown];
		var neighborListIndex = ds_list_find_index(constellationList,currentIndex.neighborDown);
		
		draw_line(xx + currentIndex.x + constellationOffsets[i].x,yy + currentIndex.y + constellationOffsets[i].y,xx + neighborIndex.x + constellationOffsets[neighborListIndex].x,yy + neighborIndex.y + constellationOffsets[neighborListIndex].y);
	}
}