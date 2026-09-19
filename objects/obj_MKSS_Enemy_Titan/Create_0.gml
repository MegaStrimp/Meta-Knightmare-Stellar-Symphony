///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Gameplay Variables
enemyID = global.MKSS_EnemyIDs[? "titan"];
hp = MKSS_Base_EnemyHP_Boss;
points = MKSS_Base_EnemyPoints_Boss;
metaPointsOnDeath = MKSS_Base_EnemyMetaPoints_Boss;
metaPointsOnOverkill = floor(metaPointsOnDeath / 2);
isBoss = true;
pauseOutsideView = false;
canHaveKnockback = false;

freezeFrameForce = 2;

enemyPhaseTargetHp = [floor(hp / 2)];
enemyPhaseSetupScript = 
[
	function()
	{
		scr_MKSS_Enemy_Titan_Normal_AttackOrder_Phase2();
	}
];

massDestructionScript = scr_MKSS_Cutscene_Preset_TitanMassDestruction;
#endregion

#region Sprites
spriteSet = global.MKSS_EnemyList[enemyID].spriteSet;
sprHurt = spriteSet.sprHurtList;
mask_index = spriteSet.maskIndex;
#endregion