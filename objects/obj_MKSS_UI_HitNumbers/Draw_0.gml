///@description Draw

#region Draw Text
if (isVisible)
{
	var fontFinal = "[" + sprite_get_name(font) + "]";
	
	scribble(string(fontFinal) + string(text) + "[/font]").align(fa_center,fa_middle).draw(x,y);
}
#endregion