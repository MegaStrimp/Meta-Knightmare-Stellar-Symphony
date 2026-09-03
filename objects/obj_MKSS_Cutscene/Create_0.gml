///@description Create

#region Initialize Variables
playerNum = 0;

speedMultFinal = global.speedMultGlobal * global.deltaTime;
localPause = global.pauseFinal;

phase = 0;
phaseTimer = 0;

stepScript = -1;
phaseSetupScript[0] = -1;
drawScript = -1;

bossSpawned = false;
musicPlayed = false;

canBePaused = true;
#endregion