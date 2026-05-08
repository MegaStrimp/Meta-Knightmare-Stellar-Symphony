///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Object Attributes
hp = 1;

deathParticleIndex = scr_MKSS_ParticleSet_StarBlockBreak;

canBeHit = true;

deathIndex = scr_MKSS_Wall_StarBlock_Death;

metaPointsChance = 2;
#endregion

#region Palette Variables
palSprite = choose(spr_MKSS_StarBlock_Palette_Normal1,spr_MKSS_StarBlock_Palette_Normal2);
palIndex = 1;
palSpd = 0;
#endregion