///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Initialize Variables
#region AI Scripts
enemyDeath = scr_MKSS_Enemy_Death;

enemyBeginStep = scr_MKSS_Enemy_BeginStep_Normal;
enemyStep = scr_MKSS_Enemy_Step_Normal;
enemyDraw = scr_MKSS_Enemy_Draw;
enemyDrawSelf = scr_MKSS_Enemy_DrawSelf;

enemyGetHit = scr_MKSS_Enemy_GetHit;
enemyGetHitObject = scr_MKSS_Enemy_GetHit_Object;
enemyWallXCollision = scr_MKSS_Enemy_WallXCollision;
enemyWallYCollision = scr_MKSS_Enemy_WallYCollision;
#endregion

#region Gameplay Variables
stunCancelTimer = -1;
canBeParried = false;
parriableParticleTimer = -1;
parriableParticleTimerMax = 5;
parryAttackIndex = -1;
isBossSetup = true;
arenaIndex = -1;

enemyPhase = 1;
enemyPhaseTargetHp = -1;
enemyPhaseSetupScript = -1;

dmg = MKSS_Base_EnemyContactDamage;

deathParticleIndex = scr_MKSS_ParticleSet_EnemyDefeatStars;

shadowAlphaTarget = position_meeting(x,y,obj_MKSS_ShadowArea);
shadowAlpha = shadowAlphaTarget;
shadowAlphaFinal = shadowAlphaTarget;

metaPointsOnHit = 0;
metaPointsOnDeath = 0;
metaPointsOnOverkill = 0;

outlineColor = [-1,-1,-1];
drawSurface = -1;
drawSurface_PixelH = shader_get_uniform(shd_ColoredOutline,"pixelH");
drawSurface_PixelW = shader_get_uniform(shd_ColoredOutline,"pixelW");
drawSurface_OutlineColor = shader_get_uniform(shd_ColoredOutline,"outlineColor");

inWater = false;

trackCheck = false;

MKSS_HurtElement = ds_list_create();
#endregion
#endregion