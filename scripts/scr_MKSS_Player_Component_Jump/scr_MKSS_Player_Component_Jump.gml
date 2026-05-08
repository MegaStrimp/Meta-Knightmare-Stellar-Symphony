///@description MKSS - Player - Component - Jump

function scr_MKSS_Player_Component_Jump()
{
	#region Jump
	var canJump = true;
	if (global.MKSS_CutsceneStopMovement) canJump = false;
	
	if (canJump)
	{
		if (input_check_pressed("A",playerNum)) jumpInputBuffer = jumpInputBufferMax;
		
		if ((!wallAbove) and (jumpInputBuffer > 0) and (!attackStopMovement))
		{
			jumpInputBuffer = jumpInputBufferMax;
		
			if (jumpCoyoteTimeBuffer > 0)
			{
				scr_PlaySfx(snd_MKSS_Jump);
			
				scr_ChangeSprite(spriteSet.sprJump);
			
				vsp = -(jumpspeed * ((isRunning * .25) + 1) * speedMultFinal);
				hasJumpLimit = true;
				hasJumped = 0;
				grounded = false;
				flag_FallRoll = true;
				canFallRoll = true;
				jumpCoyoteTimeBuffer = 0;
				jumpInputBuffer = 0;
			
				var angle = 90 + (20 * dirX);
				scr_MKSS_ParticleSet_Jump(x - (7 * dirX),y + 5,angle);
			}
			else if (!grounded)
			{
				var sfx = scr_PlaySfx(snd_MKSS_WingFlap);
				audio_sound_pitch(sfx,random_range(.85,1.15));
			
				scr_ChangeSprite(spriteSet.sprFlap);
			
				isFlying = true;
				vsp = -(jumpspeed * ((isRunning * .25) + 1) * speedMultFinal);
				hasJumpLimit = true;
				jumpCoyoteTimeBuffer = 0;
				jumpInputBuffer = 0;
				forceJump = false;
				fallHopTimer = -1;
				canFallHop = false;
				fallHopJumped = false;
			}
		}
	}
	
	#region Jump Limit
	if ((vsp < 0) and (!input_check("A",playerNum)))
	{
		if ((hasJumpLimit) and (!forceJump)) vsp = max(vsp,-(jumpspeed * ((isRunning * .25) + 1) * speedMultFinal) / 4);
	}
	#endregion
	#endregion
}