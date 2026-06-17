///@description MKSS - Enemy - Gigant Edge - AI - Normal - Charge Slam - Step

function scr_MKSS_Enemy_GigantEdge_AI_Normal_ChargeSlam_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		readyTimerMax = 70;
		readyTimer = readyTimerMax;
		
		revertTimer = -1;
		revertTimerMax = 70;
		
		swordBeamTimer = -1;
		swordBeamTimerMax = 24;
		
		sprite_index = spriteSet.sprSwordSwingPrepare;
		image_index = 0;
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Friction
		var decelFinal = decel * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		#endregion
		
		#region Gravity
		vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Ready Timer
		if (readyTimer != -1)
		{
			if (sprite_index != spriteSet.sprChargeSwingPrepare)
			{
				if (image_index >= image_number-1)
				{
					sprite_index = spriteSet.sprChargeSwingPrepare;
					image_index = 0;
					
					var nearestPlayer = instance_nearest(x,y,obj_Player);
				
					dirX = 1;
					if (nearestPlayer.x < x) dirX = -1;				
				}
			}
			
			readyTimer = max(readyTimer - speedMultFinal,0);
			if (readyTimer == 0)
			{
				sprite_index = spriteSet.sprSwordSwing;
				scr_PlaySfx(snd_MKSS_Slash2);
				image_index = 0;
				
				swordBeamTimer = swordBeamTimerMax;
				
				readyTimer = -1;
			}
		}
		#endregion
		
		#region Sword Beam Timer
		if (swordBeamTimer != -1)
		{
			swordBeamTimer = max(swordBeamTimer - speedMultFinal,0);
			if (swordBeamTimer == 0)
			{
				scr_Camera_SetScreenshake(1,2);
				
				with (instance_create_depth(x+(64*dirX),y,depth + 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					knockbackForce = 1;
					hsp = 1.5*other.dirX;
					vsp = 0;
					dirX = other.dirX;
					image_xscale = dirX * scale;
					sprite_index = spr_MKSS_Attack_GigantEdge_SwordBeam;
					mask_index = spr_MKSS_Attack_GigantEdge_SwordBeam;
					attackAIStep = scr_MKSS_Attack_GigantEdge_SwordBeam_Step;
					destroyOutsideRoom = true;
					destroyAfterCollideWall = true;
				}
				
				revertTimer = revertTimerMax;
				
				swordBeamTimer = -1;
			}
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Revert Timer
		if (revertTimer != -1)
		{
			revertTimer = max(revertTimer - speedMultFinal,0);
			if (revertTimer == 0)
			{
				var nearestPlayer = instance_nearest(x,y,obj_Player);
				
				dirX = 1;
				if (nearestPlayer.x < x) dirX = -1;
				
				imageSpeed = 1;
				
				sprite_index = spriteSet.sprIdle;
				image_index = 0;
				
				scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_GigantEdge_AI_Normal_Idle_Step);
				
				revertTimer = -1;
			}
		}
		#endregion
	}
}