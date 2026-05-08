///@description Create

#region Initialize Variables
playerNum = 0;

speedMult = 1;
speedMultFinal = speedMult * global.speedMultGlobal * global.deltaTime;
canBePaused = true;
localPause = ((global.pauseFinal) and (canBePaused));

isSelected = false;
targetNeighbor = -1;

ID = -1;

maskTriggerScript = false;
triggerScript = undefined;

maskBaseScript = false;
baseScript = undefined;

maskDrawScript = false;
drawScript = undefined;

maskNeighborLeft = false;
neighborLeft = undefined;

maskNeighborRight = false;
neighborRight = undefined;

maskNeighborUp = false;
neighborUp = undefined;

maskNeighborDown = false;
neighborDown = undefined;
#endregion