///@description MKSS - Attack - Draw

function scr_MKSS_Attack_Draw()
{
	//STRIMPTODO FIX THIS WHOLE CODE
	
	if (sprite_index != -1)
	{
		outlineColor = [-1,-1,-1];
		
		if (canBeParried)
		{
			if (floor(global.currentTimePausable / 10) % 2 == 0) outlineColor = [78 / 255,219 / 255,35 / 255];
		}
		
		if (outlineColor[0] == -1)
		{
			script_execute(attackDrawSelf);
		}
		else
		{
			var surfaceWidth = sprite_get_width(sprite_index) + 8;
			var surfaceHeight = sprite_get_height(sprite_index) + 8;
		
			if (((!surface_exists(drawSurface)) or ((surface_get_width(drawSurface) != surfaceWidth) or (surface_get_height(drawSurface) != surfaceHeight))))
			{
			    if (surface_exists(drawSurface)) surface_free(drawSurface);
			    drawSurface = surface_create(surfaceWidth,surfaceHeight);
			}
		
			surface_set_target(drawSurface);
			draw_clear_alpha(c_black,0);
			
			script_execute(attackDrawSelf);
			
			surface_reset_target();
		
			if (global.shaders)
			{
				var texelW = 1.0 / sprite_width;
				var texelH = 1.0 / sprite_height;
				
				shader_set(shd_ColoredOutline);
				shader_set_uniform_f(drawSurface_PixelW,texelW);
				shader_set_uniform_f(drawSurface_PixelH,texelH);
				shader_set_uniform_f(drawSurface_OutlineColor,outlineColor[0],outlineColor[1],outlineColor[2]);
			}
		
			draw_surface(drawSurface,x - sprite_get_xoffset(sprite_index) - 4,y - sprite_get_yoffset(sprite_index) - 4);
		
			if (global.shaders) shader_reset();
		}
	}
}