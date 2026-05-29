switchNetworkNum = 2;

activationScript = function()
{
	with (instance_create_depth(x,y,depth,obj_MKSS_Switch_Twinkle))
	{
		switchNetworkNum = 3;
		activationScript = scr_MKSS_Switch_Node_Destroy;
	}
}