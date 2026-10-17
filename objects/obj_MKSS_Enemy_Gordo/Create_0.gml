///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Gameplay Variables
enemyID = global.MKSS_EnemyIDs[? "gordo"];

hp = -1;
dmg = MKSS_Base_EnemyContactDamage * 2;

canBreakLightInvincibility = true;
canBeHurt = false;
canHaveKnockback = false;

freezeFrameForce = 2;
#endregion

#region Sprites
spriteSet = global.MKSS_EnemyList[enemyID].spriteSet;
sprHurt = spriteSet.sprHurtList;
mask_index = spriteSet.maskIndex;
#endregion