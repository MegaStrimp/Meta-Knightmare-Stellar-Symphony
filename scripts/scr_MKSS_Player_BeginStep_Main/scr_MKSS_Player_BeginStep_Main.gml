///@description MKSS - Player - Begin Step

function scr_MKSS_Player_BeginStep_Main()
{
	#region Flags
	flag_FallDuck = false;
	flag_UpDuck = false;
	flag_WalkSquish = false;
	flag_FallHop = false;
	#endregion
	
	#region Variables
	speedMultFinal = global.speedMultGlobal * global.speedMultPlayer * speedMult * global.deltaTime;
	localPause = (global.pauseFinal) or (isPaused) or (localFreezeFrameTimer != -1);
	
	canGetDownPlatform = (downHeldBuffer >= downHeldBufferPlatformMax);
	
	grounded = false;
	jumpCoyoteTimeBuffer = max(0,jumpCoyoteTimeBuffer - 1);
	
	if (!localPause)
	{
		parryAttackBuffer = false;
	}
	#endregion
	
	#region Collision Mask
	if (isDucking)
	{
		mask_index = maskDuck;
	}
	else if ((isRunning) and (!place_meeting(x + (dirX * (abs(hsp) + 4)),y,obj_Wall)))
	{
		mask_index = maskRun;
	}
	else
	{
		mask_index = maskNormal;
	}
	#endregion
	
	#region Shadow
	shadowAlphaTarget = 0;
	
	if ((position_meeting(x,y,obj_MKSS_ShadowArea)) or (instance_exists(obj_MKSS_UI_StageClear))) shadowAlphaTarget = 1;
	
	shadowAlpha = lerp(shadowAlpha,shadowAlphaTarget,.1);
	
	if (shadowAlpha < 1) shadowAlphaFinal = .66;
	if (shadowAlpha < .66) shadowAlphaFinal = .33;
	if (shadowAlpha < .33) shadowAlphaFinal = 0;
	#endregion
	
	#region Check If There's a Wall Below
	var collidingWall = noone;
	
	if (position_meeting(x,bbox_bottom + dirY,obj_Wall))
	{
		collidingWall = instance_place(x,bbox_bottom + dirY,obj_Wall);
	}
	else if (position_meeting(bbox_left,bbox_bottom + dirY,obj_Wall))
	{
		collidingWall = instance_place(bbox_left,bbox_bottom + dirY,obj_Wall);
	}
	else if (position_meeting(bbox_right,bbox_bottom + dirY,obj_Wall))
	{
		collidingWall = instance_place(bbox_right,bbox_bottom + dirY,obj_Wall);
	}
	
	if (collidingWall != noone)
	{
		groundMaterial = collidingWall.groundMaterial;
		groundSlopeType = collidingWall.groundSlopeType;
		groundPlatformType = collidingWall.groundPlatformType;
		
		grounded = true;
		forceJump = false;
		isFlying = false;
		
		#region Set Coyote Time Buffer
		jumpCoyoteTimeBuffer = jumpCoyoteTimeBufferMax;
		#endregion
		
		#region Fall Duck Flag
		if ((canFallDuck) and (upDuckTimer == -1))
		{
			flag_FallDuck = true;
		}
		canFallDuck = false;
		#endregion
		
		#region Fall Hop Flag
		if (canFallHop)
		{
			if (!fallHopJumped)
			{
				flag_FallHop = true;
				fallHopJumped = true;
			}
			else
			{
				canFallHop = false;
				fallHopJumped = false;
			}
		}
		#endregion
		
		#region Reset Fall Hop Condition
		fallHopTimer = -1;
		#endregion
		
		#region Make It So The Player Can't Get Down a Platform
		canGetDownPlatform = false;
		#endregion
	}
	else 
	{
		if (position_meeting(x,bbox_bottom + dirY,obj_Platform))
		{
			collidingWall = instance_place(x,bbox_bottom + dirY,obj_Platform);
		}
		else if (position_meeting(bbox_left,bbox_bottom + dirY,obj_Platform))
		{
			collidingWall = instance_place(bbox_left,bbox_bottom + dirY,obj_Platform);
		}
		else if (position_meeting(bbox_right,bbox_bottom + dirY,obj_Platform))
		{
			collidingWall = instance_place(bbox_right,bbox_bottom + dirY,obj_Platform);
		}
		
		if (collidingWall != noone)
		{
			if (position_meeting(x,bbox_bottom + dirY,obj_HeavyPlatform)) canGetDownPlatform = false;
		
			if ((!canGetDownPlatform) and (sign(vspPrev) != -1) and (bbox_bottom <= collidingWall.bbox_top + dirY))
			{
				groundMaterial = collidingWall.groundMaterial;
				groundSlopeType = collidingWall.groundSlopeType;
				groundPlatformType = collidingWall.groundPlatformType;
			
				grounded = true;
				forceJump = false;
				isFlying = false;
			
				#region Set Coyote Time Buffer
				jumpCoyoteTimeBuffer = jumpCoyoteTimeBufferMax;
				#endregion
			
				#region Fall Duck Flag
				if ((canFallDuck) and (upDuckTimer == -1))
				{
					flag_FallDuck = true;
				}
				canFallDuck = false;
				#endregion
			
				#region Fall Hop Flag
				if (canFallHop)
				{
					if (!fallHopJumped)
					{
						flag_FallHop = true;
						fallHopJumped = true;
					}
					else
					{
						canFallHop = false;
						fallHopJumped = false;
					}
				}
				#endregion
			
				#region Reset Fall Hop Condition
				fallHopTimer = -1;
				#endregion
			}
		}
		else
		{
			#region Reset Fall Duck Condition
			canFallDuck = true;
			#endregion
		}
	}
	#endregion
	
	#region Check If There's a Wall Above
	wallAbove = false;
	if (place_meeting(x,y - dirY,obj_Wall))
	{
		wallAbove = true;
		
		#region Up Duck Flag
		if ((canUpDuck) and (!grounded))
		{
			flag_UpDuck = true;
		}
		canUpDuck = false;
		#endregion
	}
	else
	{
		#region Reset Up Duck Condition
		canUpDuck = true;
		#endregion
	}
	#endregion
	
	if (place_meeting(x + dirX,y,obj_Wall))
	{
		#region Walk Squish Flag
		if ((canWalkSquish) and (hspPrev != 0) and (instance_place(x + dirX,y,obj_Wall).groundSlopeType == groundSlopeTypes.none))
		{
			flag_WalkSquish = true;
		}
		canWalkSquish = false;
		#endregion
	}
	else
	{
		#region Reset Walk Squish Condition
		canWalkSquish = true;
		#endregion
	}
	
	#region Decrease Jump Buffer
	jumpInputBuffer = max(0,jumpInputBuffer - 1);
	#endregion
	
	#region Decrease Attack Buffer
	attackInputBuffer = max(0,attackInputBuffer - 1);
	#endregion
	
	#region Door Enter Buffer
	if (input_check_pressed("up",playerNum))
	{
		doorEnterBuffer = true;
	}
	if (input_check_released("up",playerNum))
	{
		doorEnterBuffer = false;
	}
	#endregion
}