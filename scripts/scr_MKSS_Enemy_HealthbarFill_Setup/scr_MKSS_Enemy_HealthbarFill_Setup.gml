///@description MKSS - Enemy - Healthbar Fill - Setup

function scr_MKSS_Enemy_HealthbarFill_Setup(targetEnemy)
{
	with (targetEnemy)
	{
		healthbarFill = true;
		healthbarFillSpeed = max(healthbarFillSpeed,floor(hp / 50));
		hpHealthbar = 0;
		hpHealthbarMiddle = 0;
	}
}