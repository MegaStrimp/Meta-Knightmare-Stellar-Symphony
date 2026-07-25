///@description MKSS - Attack - Nimbia - Kracklet - Step

function scr_MKSS_Attack_Nimbia_Kracklet_Step()
{
	if (!localPause)
	{
		if (detonateTimer == -1)
		{
			#region Get Movement
			function KrackletMovement()
			{
				var _dirX = choose(-1,0,1);
				if (movementX <= movementLimit) _dirX = choose(0,1);
				if (movementX >= room_width-movementLimit) _dirX = choose(0,-1);
				var _dirY = choose(-1,0,1);
				if (movementY <= movementLimit) _dirY = choose(0,1);
				if (movementY >= room_height-movementLimit) _dirY = choose(0,-1);
				if (instance_place(x,y,obj_Wall)) _dirY = -1;
				
				movementTargetX = irandom_range(movementRangeMin,movementRangeMax) * _dirX;
				movementTargetY = irandom_range(movementRangeMin,movementRangeMax) * _dirY;
			
				eyeAngle = round(point_direction(0,0,movementTargetX,movementTargetY)/45);
			}
			#endregion
		
			#region Kracklet Movement
			if (movementTimer != -1)
			{
				movementTimer = max(movementTimer - speedMultFinal,0);
				if (movementTimer == 0)
				{
					movementX = x+movementTargetX;
					movementY = y+movementTargetY;
				
					movementX = clamp(movementX,movementLimit,room_width-movementLimit);
					movementY = clamp(movementY,movementLimit,room_height-movementLimit);
				
					repeat(8)
					{
						var _spdMax = 1;
						var _spd = -random_range(0,_spdMax);
						var _angle = irandom_range(0,359);
					
						scr_MKSS_ParticleSet_NimbiaCloud(x + irandom_range(-16,16),y + irandom_range(-16,16),lengthdir_x(_spd,_angle),lengthdir_y(_spd,_angle),-1);
					}
				
					KrackletMovement();
				
					movementDmgCooldown = movementDmgCooldownMax;
					movementTimer = movementTimerMax + irandom_range(-movementTimerMaxAdd,movementTimerMaxAdd);
				}
			}
		
			if (movementX != -1) or (movementY != -1) 
			{
				scr_MoveTo(movementX,movementY,movementFrames*speedMultFinal);
			
				if (abs(hsp) > .5) or (abs(vsp) > .5) scr_MKSS_ParticleSet_NimbiaCloud(x + irandom_range(-2,2),y + irandom_range(-2,2),random_range(0,1)*-sign(hsp),random_range(0,1)*-sign(vsp),1);
			}
			#endregion
		
			#region Trigger
			var _trigger = false;
			if (movementDmgCooldown == -1)
			{
				if (spd == 0)
				{
					with (instance_place(x,y,obj_MKSS_Attack))
					{
						if (dmg)
						{
							//if (!isEnemy) _trigger = true;
							//else if (object_index != other.object_index) and (owner == other.owner)
							//{
							//	_trigger = true;
							//}
							_trigger = true;
						}
					}
					if (instance_place(x,y,obj_MKSS_Player)) or (instance_place(x,y,obj_MKSS_Enemy_Nimbia)) _trigger = true;
				}
			}
			else
			{
				movementDmgCooldown = max(movementDmgCooldown - speedMultFinal,0);
				if (movementDmgCooldown == 0)
				{
					movementDmgCooldown = -1;
				}
			}
		
			if (_trigger)
			{
				detonateTimer = detonateTimerMax;
			}
			#endregion
		
			#region Position
			if (!init)
			{
				hsp = lengthdir_x(spd,angle);
				vsp = lengthdir_y(spd,angle);
				spd = scr_Entity_Friction(spd,decel * speedMultFinal);
				if (spd <= .1)
				{
					spd = 0;
				
					movementX = x;
					movementY = y;
				
					KrackletMovement();
				
					init = true;
				}
			}
			scr_Component_SetPosition(hsp,vsp);
			#endregion
		}
		else
		{
			sprite_index = spr_MKSS_Attack_Nimbia_Kracklet_Hurt;
			
			detonateTimer = max(detonateTimer - speedMultFinal,0);
			if (detonateTimer == 0)
			{
				var i = 0;
				repeat(4)
				{
					var _angle = 45+(90*i);
					with (instance_create_depth(x + lengthdir_x(4,_angle),y +  + lengthdir_y(4,_angle),depth + 1,obj_MKSS_Attack))
					{
						owner = other.owner;
						isEnemy = true;
						dmg = 1;
						sprite_index = spr_MKSS_Attack_Nimbia_KrackletNeedle;
						mask_index = spr_MKSS_Attack_Nimbia_KrackletNeedle;
						attackAIStep = scr_MKSS_Attack_Nimbia_KrackletNeedle_Step;
						angle = _angle;
						spd = 3;
						destroyOutsideRoom = true;
						destroyAfterCollideWall = true;
						image_index = i;
					}
					i++;
				}
			
				repeat(24)
				{
					scr_MKSS_ParticleSet_NimbiaCloud(x + irandom_range(-16,16),y + irandom_range(-16,16),,,-1);
				}
			
				owner.krackletAmount--;
			
				instance_destroy();
			}
		}
	}
}