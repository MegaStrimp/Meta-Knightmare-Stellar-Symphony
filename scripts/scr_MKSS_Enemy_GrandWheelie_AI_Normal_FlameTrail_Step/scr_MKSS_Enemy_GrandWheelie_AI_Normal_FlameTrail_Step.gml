///@description MKSS - Enemy - Grand Wheelie - AI - Normal - Flame Trail - Step

function scr_MKSS_Enemy_GrandWheelie_AI_Normal_FlameTrail_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		scr_Component_WalkAndTurn_Step();
		#endregion
		
		#region Wall Detection
		if ((!isTurning) and (position_meeting(x + (dirX * floor(global.gameTileSize / 2)),y - 8,obj_Wall)))
		{
			dirX *= -1;
			isTurning = true;
			
			sprite_index = spriteSet.sprTurn;
			image_index = 0;
		}
		#endregion
		
		#region Friction
		var decelFinal = decel * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		#endregion
		
		#region Gravity
		vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Animation
		if ((hurtTimer == -1) and (hp > 0))
		{
			if (isTurning)
			{
				sprite_index = spriteSet.sprTurn;
			}
			else
			{
				sprite_index = spriteSet.sprWalk;
			}
		}
		#endregion
	}
}