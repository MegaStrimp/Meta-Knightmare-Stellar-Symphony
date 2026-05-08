///@description Create

#region Initialize Variables
spawnedEnemyIndexes = ds_list_create();

owner = -1;

enemyObject = -1;

dirX = 1;
dirY = 1;
scale = 1;

enemyAISetup = -1;
enemyAISetupArg = [];

enemySpawnSound = -1;

canSpawnEnemy = true;
enemyHasSpawner = true;
destroyAfterSpawning = false;

bypassViewCheck = false;

spawnTimerMax = 0;
spawnTimer = spawnTimerMax;
#endregion