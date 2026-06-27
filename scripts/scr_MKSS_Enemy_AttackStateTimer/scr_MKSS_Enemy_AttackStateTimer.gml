function scr_MKSS_Enemy_AttackStateTimer()
{
	if (attackStateTimer[attackState] != -1)
	{
		attackStateTimer[attackState] = max(attackStateTimer[attackState] - speedMultFinal,0);
		if (attackStateTimer[attackState] == 0)
		{
			attackStateTimer[attackState] = -1;
		}
	}
}