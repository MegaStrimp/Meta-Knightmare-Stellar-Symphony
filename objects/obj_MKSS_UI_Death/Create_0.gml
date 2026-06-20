///@description Create

#region Initialize Variables
playerNum = 0;

surface = surface_create(global.gameWidth,global.gameHeight);
alpha = 0;
circleRadius = 0;

decalLengthTarget = 0;
decalLength = -50;

currentMetaPoints = global.MKSS_PlayerMetaPoints[playerNum];
decreasedMetaPoints = min(100,ceil(currentMetaPoints / 10));
decreasedMetaPointsOffset = 8;
metaPointsTarget = currentMetaPoints - decreasedMetaPoints;

pointTimer = -1;
pointTimerMax = 60;
if (decreasedMetaPoints != 0) pointTimer = pointTimerMax;

pointFlagTimer = -1;

exitTimerMax = 210;
exitTimer = exitTimerMax;
#endregion