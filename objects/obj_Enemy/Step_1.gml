///@description Begin Step

#region Variables
outsideViewTrigger = (scr_Entity_OutsideView(32) * (hp > 0) * !hasKnockback * (hurtTimer == -1));

speedMultFinal = global.speedMultGlobal * global.speedMultEnemy * speedMult;
localPause = (global.pauseFinal) or (localFreezeFrameTimer != -1) or ((outsideViewTrigger) and (pauseOutsideView));
localPause_NoFreezeFrame = (global.pauseFinal) or ((outsideViewTrigger) and (pauseOutsideView));

grounded = false;
if (place_meeting(x,y + dirY,obj_ParentWall))
{
	grounded = true;
}

wallAbove = false;
if (place_meeting(x,y - dirY,obj_ParentWall))
{
	wallAbove = true;
}

if (maxHp == -1) maxHp = hp;
#endregion

#region Spawner
if ((hasSpawner) and (spawnerIndex != -1) and ((outsideViewTrigger) and (pauseOutsideView)))
{
	with (spawnerIndex) canSpawnEnemy = true;
	
	instance_destroy();
}
#endregion

#region Begin Step
if (enemyBeginStep != -1) script_execute(enemyBeginStep);
#endregion