///@description MKSS - Macro Table

function scr_MKSS_MacroTable()
{
	#macro MKSS_Base_PlayerHP 200
	#macro MKSS_Base_PlayerHP_Upgrade 50
	
	#macro MKSS_Base_MetaQuickMult .5
	
	#macro MKSS_Base_SonicWingsMult .5
	
	#macro MKSS_Base_PlayerContactDamage 50
	
	#macro MKSS_Base_GalaxiaDamage 40
	
	#macro MKSS_Base_BuzzcutDamage 15
	
	#macro MKSS_Base_EnemyContactDamage 30
	
	#macro MKSS_Base_EnemyBasicDamage 50
	#macro MKSS_Base_EnemyMediumDamage 75
	
	#macro MKSS_Base_EnemyHP_Fodder 100
	#macro MKSS_Base_EnemyHP_Attacker 150
	#macro MKSS_Base_EnemyHP_Advanced 250
	#macro MKSS_Base_EnemyHP_Microboss 750
	#macro MKSS_Base_EnemyHP_Miniboss 1500
	#macro MKSS_Base_EnemyHP_Boss 3000
	
	#macro MKSS_Base_EnemyPoints_Fodder 100
	#macro MKSS_Base_EnemyPoints_Attacker 150
	#macro MKSS_Base_EnemyPoints_Advanced 250
	#macro MKSS_Base_EnemyPoints_Microboss 500
	#macro MKSS_Base_EnemyPoints_Miniboss 2500
	
	#macro MKSS_Base_EnemyMetaPoints_Fodder 10
	#macro MKSS_Base_EnemyMetaPoints_Attacker 15
	#macro MKSS_Base_EnemyMetaPoints_Advanced 25
	#macro MKSS_Base_EnemyMetaPoints_Microboss 50
	#macro MKSS_Base_EnemyMetaPoints_Miniboss 150
	
	#region Colors
	#macro MKSS_Base_Color_StarryShores "#0094FF"
	#macro MKSS_Base_Color_RoyalReeve "#FF9A13"
	#macro MKSS_Base_Color_LivingLoom "#3BC600"
	#macro MKSS_Base_Color_FissionFactory "#C63E03"
	#macro MKSS_Base_Color_AdAstra "#212960"
	#macro MKSS_Base_Color_StarryShoresEX "#9E0B0F"
	#macro MKSS_Base_Color_RoyalReeveEX "#A787FF"
	#macro MKSS_Base_Color_LivingLoomEX "#BFE500"
	#macro MKSS_Base_Color_FissionFactoryEX "#7F5000"
	#macro MKSS_Base_Color_AdAstraEX "#FF597A"
	
	#macro MKSS_Base_Color_ChasseEmeeTitle "#EBC39B"
	#macro MKSS_Base_Color_ChasseEmeeSubitle "#A93233"
	#macro MKSS_Base_Color_NimbiaTitle "#FF7F27"
	#macro MKSS_Base_Color_NimbiaSubitle "#F8E2B6"
	#macro MKSS_Base_Color_StarlessTitle "#74B8FF"
	#macro MKSS_Base_Color_StarlessSubitle "#235297"
	
	#macro MKSS_Base_Color_BlueGem "#224CF5"
	#macro MKSS_Base_Color_RedGem "#940F2E"
	#macro MKSS_Base_Color_BlueGemEX "#3E2ED1"
	#macro MKSS_Base_Color_RedGemEX "#8A3A6F"
	
	#macro MKSS_Base_Color_HalberdOil "#591F37"
	#macro MKSS_Base_Color_Andromeda "#4483D4"
	#macro MKSS_Base_Color_Completion "#FFD800"
	#macro MKSS_Base_Color_Parry "#4EDB23"
	#endregion
	
	#region Data Percentages
	//STRIMPTODO Add more data percentage macros
	#macro MKSS_Base_DataPercentage_Upgrade 1
	#endregion
	
	#region Virtual Buttons
	#macro MKSS_Base_VirtualButton_Thumbstick_X 21
	#macro MKSS_Base_VirtualButton_Thumbstick_Y 139
	#macro MKSS_Base_VirtualButton_Thumbstick_Radius 16
	
	#macro MKSS_Base_VirtualButton_A_X1 190
	#macro MKSS_Base_VirtualButton_A_Y1 135
	#macro MKSS_Base_VirtualButton_A_X2 211 - 5
	#macro MKSS_Base_VirtualButton_A_Y2 156 - 5
	
	#macro MKSS_Base_VirtualButton_B_X1 215
	#macro MKSS_Base_VirtualButton_B_Y1 135
	#macro MKSS_Base_VirtualButton_B_X2 236 - 5
	#macro MKSS_Base_VirtualButton_B_Y2 156 - 5
	
	#macro MKSS_Base_VirtualButton_X_X1 190
	#macro MKSS_Base_VirtualButton_X_Y1 110
	#macro MKSS_Base_VirtualButton_X_X2 211 - 5
	#macro MKSS_Base_VirtualButton_X_Y2 131 - 5
	
	#macro MKSS_Base_VirtualButton_Y_X1 215
	#macro MKSS_Base_VirtualButton_Y_Y1 110
	#macro MKSS_Base_VirtualButton_Y_X2 236 - 5
	#macro MKSS_Base_VirtualButton_Y_Y2 131 - 5
	
	#macro MKSS_Base_VirtualButton_L_X1 4
	#macro MKSS_Base_VirtualButton_L_Y1 93
	#macro MKSS_Base_VirtualButton_L_X2 27 - 5
	#macro MKSS_Base_VirtualButton_L_Y2 106 - 5
	
	#macro MKSS_Base_VirtualButton_LT_X1 4
	#macro MKSS_Base_VirtualButton_LT_Y1 76
	#macro MKSS_Base_VirtualButton_LT_X2 27 - 5
	#macro MKSS_Base_VirtualButton_LT_Y2 89 - 5
	
	#macro MKSS_Base_VirtualButton_R_X1 213
	#macro MKSS_Base_VirtualButton_R_Y1 93
	#macro MKSS_Base_VirtualButton_R_X2 236 - 5
	#macro MKSS_Base_VirtualButton_R_Y2 106 - 5
	
	#macro MKSS_Base_VirtualButton_RT_X1 213
	#macro MKSS_Base_VirtualButton_RT_Y1 76
	#macro MKSS_Base_VirtualButton_RT_X2 236 - 5
	#macro MKSS_Base_VirtualButton_RT_Y2 89 - 5
	
	#macro MKSS_Base_VirtualButton_Start_X1 122
	#macro MKSS_Base_VirtualButton_Start_Y1 4
	#macro MKSS_Base_VirtualButton_Start_X2 145 - 5
	#macro MKSS_Base_VirtualButton_Start_Y2 17 - 5
	
	#macro MKSS_Base_VirtualButton_Select_X1 95
	#macro MKSS_Base_VirtualButton_Select_Y1 4
	#macro MKSS_Base_VirtualButton_Select_X2 118 - 5
	#macro MKSS_Base_VirtualButton_Select_Y2 17 - 5
	#endregion
}