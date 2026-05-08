///@description Main

#region Text Movement
topTextX = (topTextX + topTextSpd) % topTextWidth;
topTextY = lerp(topTextY,topTextYTarget,.1);

bottomTextX = (bottomTextX + bottomTextSpd) % bottomTextWidth;
bottomTextY = lerp(bottomTextY,bottomTextYTarget,.1);

middleTextLength = lerp(middleTextLength,middleTextLengthTarget,.1);
#endregion

#region Decals
decalWidth = lerp(decalWidth,decalWidthTarget,.2);
#endregion

#region State Timer
if (stateTimer != -1)
{
	stateTimer = max(stateTimer - speedMultFinal,0);
	if (stateTimer == 0)
	{
		state += 1;
		
		switch (state)
		{
			case 1:
			middleTextLengthTarget = 0;
			
			stateTimer = 50;
			break;
			
			case 2:
			global.hasHud = true;
			global.canGamePause = true;
			
			instance_destroy();
			
			stateTimer = -1;
			break;
		}
		
	}
}
#endregion