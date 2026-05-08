function scr_JumpToPoint_Step(_speedMult)
{
	if (variable_instance_exists(id, "jump_data") && jump_data.active) 
	{
	    x += jump_data.vx*_speedMult;
	    y += jump_data.vy*_speedMult;

	    // Apply gravity to vx instead of vy for horizontal arc
	    if (jump_data.horizontal) jump_data.vx += jump_data.gravity*_speedMult;
	    else jump_data.vy += jump_data.gravity*_speedMult;

	    jump_data.time += _speedMult;

	    if (jump_data.time >= jump_data.time_max) 
		{
	        x = jump_data.target_x;
	        y = jump_data.target_y;
	        jump_data.active = false;
	    }
	}

}