///@description MKSS - Player - Interaction - Door

function scr_MKSS_Player_Interaction_Door(targetState)
{
	if ((doorEntered == -1) and (!isAttacking) and (!global.MKSS_CutsceneStopMovement))
	{
		var entered = false;
		
		with (obj_Door)
		{
			if ((place_meeting(x,y,other)) and (canBeEntered) and (other.doorEnterBuffer))
			{
				other.doorEntered = id;
				other.hsp = 0;
				other.vsp = 0;
				
				entered = true;
				
				scr_PlaySfx(snd_MKSS_DoorEnter);
				
				if (targetState != -1)
				{
					scr_Player_CancelAttack(other,other.attackIndex);
					scr_Player_ChangePlayerState_Step(other,targetState);
					scr_Debug_WriteLog("Player " + string(other.playerNum) + " Entered a Door");
				}
			}
		}
		
		if ((targetState != -1) and (entered)) scr_ChangeSprite(spriteSet.sprDoorEnter);
	}
}