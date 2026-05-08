///@description MKSS - Weapon - Galaxia - Setup

function scr_MKSS_Weapon_Galaxia_Setup()
{
	#region Initialize Variables
	galaxia_BasicCombo_Index = 0;
	galaxia_BasicCombo_Timer = -1;
	galaxia_BasicCombo_TimerMax = 45;
	
	galaxia_Finisher_Timer = -1;
	galaxia_Finisher_TimerMax = 30;
	
	galaxia_Run_Index = 0;
	galaxia_Run_Timer = -1;
	galaxia_Run_TimerMax = 15;
	
	galaxia_Kick_Movespeed = 4;
	
	galaxia_Stab_Movespeed = 4;
	galaxia_Stab_Decel = .125;
	
	galaxia_DownThrust_Grav = .6;
	galaxia_DownThrust_GravLimit = 6;
	galaxia_DownThrust_StateTimerMax = 15;
	galaxia_DownThrust_EndTimerMax = 15;
	#endregion
}