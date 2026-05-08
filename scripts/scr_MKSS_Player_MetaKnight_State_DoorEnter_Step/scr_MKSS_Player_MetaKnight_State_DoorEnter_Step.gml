///@description MKSS - Player - Meta Knight - State - Door Enter - Step

function scr_MKSS_Player_MetaKnight_State_DoorEnter_Step()
{
	#region Door Fade
	if ((!doorFade) and (!instance_exists(obj_Transition)))
	{
		scr_GoToRoom_PlayerPosition(doorEntered.targetRoom,false,doorEntered.playerSpawnX,doorEntered.playerSpawnY);
		doorFade = true;
	}
	#endregion
	
	#region Animation
	sprite_index = spriteSet.sprDoorEnter;
	#endregion
}