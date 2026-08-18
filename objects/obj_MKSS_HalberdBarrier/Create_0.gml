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

x = barrierX[global.MKSS_BarrierIndex];
targetX = x;
#endregion

#region Create Surface
if (!instance_exists(obj_MKSS_Surface_Planetarium)) instance_create_depth(0,0,0,obj_MKSS_Surface_Planetarium);
#endregion

#region Play Cutscene
if (global.MKSS_BarrierIndex != global.MKSS_BarrierIndexTarget)
{
	if (global.MKSS_BarrierIndex < 2) //STRIMPTODO For the demo
	{
		with (instance_create_depth(0,0,0,obj_MKSS_Cutscene))
		{
			scr_MKSS_Cutscene_Preset_HalberdBarrier();
		}
	}
}
#endregion

/*STRIMPTODO read below

if X stage is unlocked and global.MKSS_BarrierIndex is < than Y, execute a cutscene