///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Initialize Variables
ambience = -1;

barrierX = 
[
	1224, //Default
	1848, //Royal Reeve Unlocked
	1848, //Living Loom Unlocked STRIMPTODO [Release] Calibrate these before full release
	1848, //Fission Factory Unlocked
	1848, //Ad Astra Unlocked
	1848 //Postgame Unlocked
];

show_debug_message(global.MKSS_BarrierIndex)
show_debug_message(barrierX[0])
x = barrierX[global.MKSS_BarrierIndex];
#endregion

#region Create Surface
if (!instance_exists(obj_MKSS_Surface_Planetarium)) instance_create_depth(0,0,0,obj_MKSS_Surface_Planetarium);
#endregion

/*STRIMPTODO read below

if X stage is unlocked and global.MKSS_BarrierIndex is < than Y, execute a cutscene