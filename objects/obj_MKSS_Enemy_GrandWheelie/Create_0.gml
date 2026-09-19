///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Gameplay Variables
enemyID = global.MKSS_EnemyIDs[? "grandWheelie"];
hp = MKSS_Base_EnemyHP_Miniboss;
points = MKSS_Base_EnemyPoints_Miniboss;
metaPointsOnDeath = MKSS_Base_EnemyMetaPoints_Miniboss;
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
		var sfx = scr_PlaySfx(snd_MKSS_BossBoom);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		
		scr_MKSS_Enemy_SetPhaseTransition(id);
		
		scr_MKSS_Enemy_GrandWheelie_Normal_AttackOrder_Phase2();
	}
];

canHaveCorpse = true;
#endregion

#region Sprites
spriteSet = global.MKSS_EnemyList[enemyID].spriteSet;
sprHurt = spriteSet.sprHurtList;
mask_index = spriteSet.maskIndex;
#endregion