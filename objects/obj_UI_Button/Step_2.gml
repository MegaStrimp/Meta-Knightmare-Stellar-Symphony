///@description End Step

#region Select Neighbor
if ((isSelected) and (targetNeighbor != -1))
{
	scr_UI_Button_Select(targetNeighbor);
	
	targetNeighbor = -1;
}
#endregion