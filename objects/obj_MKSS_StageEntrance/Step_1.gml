///@description Begin Step

#region Variables
localPause = global.pauseFinal;
speedMultFinal = global.speedMultGlobal * global.deltaTime;

if (ownerPedestal == -1) ownerPedestal = instance_nearest(x,y,obj_MKSS_Pedestal);
#endregion