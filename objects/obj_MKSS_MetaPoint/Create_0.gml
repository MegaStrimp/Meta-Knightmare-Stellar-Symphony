///@description Create

#region Physics Variables
spdMax = 6;
var speedRand = irandom_range(0,floor(spdMax / 2));
spd = spdMax - speedRand;
spdTarget = spdMax - speedRand;
angle = 0;
chaseTimer = 10;
changeSpd = false;
#endregion

#region Points Variables
points = 1;
pointSize = 0;
collectTimer = 15;
#endregion

#region Gameplay Variables
targetPlayer = -1;

characterSetup = true;

speedMult = 1;
speedMultFinal = 1;
localPause = false;

trailTimerMax = 15;
trailTimer = trailTimerMax - irandom_range(0,3);
#endregion