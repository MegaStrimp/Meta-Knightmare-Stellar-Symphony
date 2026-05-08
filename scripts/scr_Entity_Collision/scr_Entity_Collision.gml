///@description Entity - Collision

function scr_Entity_Collision(hasWallCollision = true,XCollisionScript = -1,YCollisionScript = -1)
{
	#region Variables
	hspPrev = hsp;
	vspPrev = vsp;
	
	hspFinal = hsp;
	vspFinal = vsp;
	#endregion
	
	#region Slopes
	if (hasWallCollision)
	{
		if ((!place_meeting(x + hspFinal,y,obj_Wall)) and (place_meeting(x,y + dirY,obj_Wall)) and (!place_meeting(x,y + dirY,obj_Platform)))
		{
			yplus = 0;
			while (!place_meeting(x + hspFinal,y + yplus,obj_Wall) && yplus <= abs(hspFinal))
			{
				yplus += 1;
			}
			y += yplus;
		}
	}
	#endregion
	
	#region Platform Collision
	if (hasWallCollision)
	{
		if (position_meeting(x,bbox_bottom + max(1,vspFinal),obj_Platform))
		{
			var collidingWall = instance_place(x,bbox_bottom + max(1,vspFinal),obj_Platform);
			
			var canGetDown = false;
			if ((object_index == obj_Player) or (object_get_parent(object_index) == obj_Player)) //STRIMPTODO Refactor
			{
				if ((canGetDownPlatform) and (collidingWall.object_index != obj_HeavyPlatform)) canGetDown = true;
			}
			
			if ((!canGetDown) and (sign(vspFinal) == 1) and (bbox_bottom <= collidingWall.y + max(1, vspFinal)))
			{
				while (!place_meeting(x,y + max(1,vspFinal),obj_Platform))
				{
					y += sign(vspFinal);
				}
				
				vspFinal = 0;
				vsp = 0;
			}
		}
	}
	#endregion
	
	#region Horizontal Wall Collision
	if (hasWallCollision)
	{
		if (place_meeting(x + hspFinal,y,obj_Wall))
		{
			yplus = 0;
			while ((place_meeting(x + hspFinal,y - yplus,obj_Wall)) and (yplus <= abs(1 * hspFinal)))
			{
				yplus += 1;
			}
			
			if place_meeting(x + hspFinal,y - yplus,obj_Wall)
			{
				while ((!place_meeting(x + sign(hspFinal),y,obj_Wall)) and (hspFinal != 0))
				{
					x += sign(hspFinal);
				}
				
				hspFinal = 0;
				
				if (XCollisionScript != -1) script_execute(XCollisionScript);
				
				hsp = hspFinal;
			}
			else
			{
				y -= yplus;
			}
		}
	}
	
	x += hspFinal;
	#endregion
	
	#region Vertical Wall Collision
	if (hasWallCollision)
	{
		if (place_meeting(x,y + vspFinal,obj_Wall))
		{
			while ((!place_meeting(x,y + sign(vspFinal),obj_Wall)) and (vspFinal != 0))
			{
				y += sign(vspFinal);
			}
			
			vspFinal = 0;
			
			if (YCollisionScript != -1) script_execute(YCollisionScript);
			
			vsp = vspFinal;
		}
	}
	
	y += vspFinal;
	#endregion
}