///@description Create

#region Initialize Variables
#region AI Scripts
attackAIBeginStep = -1;
attackAIStep = -1;
attackAIEndStep = -1;

enemyHitBehavior = -1;
enemyKnockbackBehavior = -1;

attackBeginStep = -1;
attackStep = -1;
attackEndStep = -1;
attackDraw = -1;
attackDrawSelf = -1;
attackAnimationEnd = -1;
#endregion

#region Gameplay Variables
speedMult = 1;
speedMultFinal = 1;
localPause = false;
canBePaused = true;
#endregion

#region Attack Variables
owner = -1;
isEnemy = false;

dirX = 1;
dirY = 1;

dmg = 1;
knockback = 0;

attackEnemyHitParticleIndex = -1;
attackWallHitParticleIndex = -1;

followOwner = false;
followOwnerImageIndex = false;
destroyAfterAnimation = false;
destroyIfOwnerNotAttack = false;
destroyAfterHit = false;
destroyAfterCollideWall = false;
destroyAfterCollidePlatform = false;
destroyOutsideView = false;
destroyOutsideRoom = false;
destroyTimer = -1;
pauseAfterAnimation = false;
canBreakBlocks = false;
canBeFinisher = false;
canBreakLightInvincibility = false;
isMelee = false;
isMultiHit = false;
multiHitCount = 0;
multiHitFlag = false;
multiHitEvent = -1;
multiHitTimer = -1;
multiHitTimerMax = -1;
enemyHurtTimerMult = 1;
freezeFrameForce = 1;
canHitIfHurt = true;
canSetLastHitProjectile = true;
canBeParried = false;

bonusLootingAmount = 0;

knockbackAngle = 90;
knockbackForce = 2;

attackTypes = ds_list_create();
attackTypeResistances = ds_map_create();
#endregion

#region Visual Variables
shakeX = 0;
shakeY = 0;

autoScale = true;

scale = 1;

drawDirX = 1;
drawDirY = 1;

imageSpeed = 1;
#endregion
#endregion