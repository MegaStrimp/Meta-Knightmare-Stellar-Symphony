///@description Main

#region Depth
depth = anchorDepth;
if (((path_position >= .2) and (path_position < .45)) or (path_position >= .65))
{
	depth = anchorDepth - 1;
}
#endregion