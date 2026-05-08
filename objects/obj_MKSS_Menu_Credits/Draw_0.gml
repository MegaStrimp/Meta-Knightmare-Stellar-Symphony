///@description Draw

#region Credits Names
var yy = 0;
var textType = 0;
var text = "";
var sep = 0;

for (var i = 0; i < array_length(creditsNames); i++)
{
	text = creditsNames[i];
	textType = string_char_at(text,1);
	text = string_copy(text,2,string_length(text));
	text = string_upper(text);
	
	sep = 9;
	switch (textType)
	{
		case 0:
		break;
		
		case 1:
		sep = 18;
		break;
		
		case 2:
		draw_set_color(make_color_rgb(48,65,113));
		break;
		
		case 3:
		draw_set_color(make_color_rgb(88,94,112));
		sep = 0;
		break;
		
		case 4:
		draw_set_color(make_color_rgb(91,123,211));
		break;
		
		case 5:
		draw_set_color(make_color_rgb(91,123,211));
		sep = 0;
		break;
	}
	
	draw_text(4,yStart + yScroll + yy,text);
	yy += sep;
	
	draw_set_color(c_white);
}
#endregion