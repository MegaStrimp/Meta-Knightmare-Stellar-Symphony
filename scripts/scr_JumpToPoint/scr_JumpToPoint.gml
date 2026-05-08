/// @function jump_to_point_in_frames(target_x, target_y, frames, peak_height)
/// @desc Makes the instance jump in an arc to (target_x, target_y) in a specified number of frames.
/// @param target_x
/// @param target_y
/// @param frames
/// @param peak_height
/// @param horizontal

function scr_JumpToPoint(_tx, _ty, _frames, _peak, _horizontal = false) 
{
	if (!_horizontal)
	{
	    // starting position
	    var _sx = x;
	    var _sy = y;

	    // total displacement
	    var _dx = _tx - _sx;
	    var _dy = _ty - _sy;

	    // horizontal velocity (constant)
	    var _vx = _dx / _frames;

	    // gravity so that the object peaks halfway through
	    var _gravity = (8 * _peak) / sqr(_frames); // derived from v = -g*t/2 to reach 0 at halfway
	    var _vy = -_gravity * (_frames / 2);

	    // store jump data in instance
	    jump_data = 
		{
	        active: true,
	        time: 0,
	        time_max: _frames,
	        vx: _vx,
	        vy: _vy,
	        gravity: _gravity,
	        start_x: _sx,
	        start_y: _sy,
	        target_x: _tx,
	        target_y: _ty,
			horizontal: false
	    };
	}
	else
	{
		// Starting position
	    var _sx = x;
	    var _sy = y;

	    // Total displacement
	    var _dx = _tx - _sx;
	    var _dy = _ty - _sy;

	    // Vertical velocity (constant)
	    var _vy = _dy / _frames;

	    // "Horizontal gravity" to create the arc
	    var _gravity = (8 * _peak) / sqr(_frames);
	    var _vx = -_gravity * (_frames / 2);

	    // Store identical struct fields as the original vertical jump
	    jump_data =
		{
	        active: true,
	        time: 0,
	        time_max: _frames,
	        vx: _vx,
	        vy: _vy,
	        gravity: _gravity,
	        start_x: _sx,
	        start_y: _sy,
	        target_x: _tx,
	        target_y: _ty,
			horizontal: true
	    };
	}
}
