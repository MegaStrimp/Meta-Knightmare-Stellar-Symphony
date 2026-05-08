///@description Create

#region Initialize Variables
spawnList = -1;
spawnList_CurrentIndex = -1;
spawnedEnemyCount = 0;

objectsToDestroy = [];
endsTheStage = false;
endsTheStage_TargetRoom = -1;
cameraFollows = false;
cameraSetsLimits = false;

arenaEnded = false;
playEndSound = false;
endScript = -1;

activeTimer = 10;
spawnTimer = -1;
endTimer = -1;
endTimerMax = 210;
#endregion