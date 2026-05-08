///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Initialize Variables
#region AI Scripts
enemyDeath = scr_MKSS_Enemy_Death;

enemyBeginStep = scr_MKSS_Enemy_BeginStep_Normal;
enemyDraw = scr_MKSS_Enemy_Draw;
enemyDrawSelf = scr_MKSS_Enemy_DrawSelf;
#endregion

#region Gameplay Variables
stunCancelTimer = -1;
canBeParried = false;
parriableParticleTimer = -1;
parriableParticleTimerMax = 5;
parryAttackIndex = -1;
isBossSetup = true;
arenaIndex = -1;

shadowAlphaTarget = position_meeting(x,y,obj_MKSS_ShadowArea);
shadowAlpha = shadowAlphaTarget;
shadowAlphaFinal = shadowAlphaTarget;

outlineColor = [-1,-1,-1];
drawSurface = -1;
drawSurface_PixelH = shader_get_uniform(shd_ColoredOutline,"pixelH");
drawSurface_PixelW = shader_get_uniform(shd_ColoredOutline,"pixelW");
drawSurface_OutlineColor = shader_get_uniform(shd_ColoredOutline,"outlineColor");
#endregion
#endregion