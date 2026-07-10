function scr_MoveTo(tarX = 0,tarY = 0,_spd = 1)
{
	if (tarX != 0)
	{
		if (x != tarX) hsp = ((tarX - x) / _spd);
		else 
		{
			x = tarX;
			
			hsp = 0;
		}
	}
	
	if (tarY != 0)
	{
		if (y != tarY) vsp = ((tarY - y) / _spd);
		else 
		{
			y = tarY;
			
			vsp = 0;
		}
	}
}