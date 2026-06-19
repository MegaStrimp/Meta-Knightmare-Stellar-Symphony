///@description Create

#region Initialize Variables
playerNum = 0;
global.MKSS_PlayerMetaPoints[playerNum] = irandom_range(50,99999);

alpha = 0;

currentMetaPoints = global.MKSS_PlayerMetaPoints[playerNum];
decreasedMetaPoints = min(100,floor(currentMetaPoints / 10));
decreasedMetaPointsOffset = 8;
metaPointsTarget = currentMetaPoints - decreasedMetaPoints;

pointTimer = -1;
pointTimerMax = 60;
if (decreasedMetaPoints != 0) pointTimer = pointTimerMax;

pointFlagTimer = -1;

exitTimerMax = 300;
exitTimer = exitTimerMax;
#endregion