///@description Angle Loop
function scr_AngleLoop(_angle)
{
	/*
	var _angleFinal = _angle;
	
	if (_angleFinal >= 360) _angleFinal -= 360;
	if (_angleFinal < 0) _angleFinal += 360;
	*/
	return (_angle + 360) % 360;
}