///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Initialize Variables
#region AI Scripts
attackDraw = scr_MKSS_Attack_Draw;
attackDrawSelf = scr_MKSS_Attack_DrawSelf;
#endregion

#region Gameplay Variables
stunCancelTimer = -1;
canBeParried = false;
parryAttackIndex = -1;
parriableParticleTimer = -1;
parriableParticleTimerMax = 5;

outlineColor = [-1,-1,-1];
drawSurface = -1;
drawSurface_PixelH = shader_get_uniform(shd_ColoredOutline,"pixelH");
drawSurface_PixelW = shader_get_uniform(shd_ColoredOutline,"pixelW");
drawSurface_OutlineColor = shader_get_uniform(shd_ColoredOutline,"outlineColor");
#endregion
#endregion