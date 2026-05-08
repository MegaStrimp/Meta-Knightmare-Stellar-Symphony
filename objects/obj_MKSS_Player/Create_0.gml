///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Character Setup
if (characterSetup)
{
	script_execute(global.MKSS_PlayerList[global.playerCharacter[playerNum]].setupScript);
	
	if (playerNum == 0)
	{
		scr_Camera_FollowObject(id,cameraXOffset + global.hudCameraXOffset,cameraYOffset + global.hudCameraYOffset);
	}
	
	spriteSet = global.MKSS_PlayerList[global.playerCharacter[playerNum]].spriteSet[global.MKSS_PlayerSkin[playerNum]];
	weaponSpriteSet = undefined;
	if (currentAbility != -1)
	{
		weaponSpriteSet = global.MKSS_WeaponList[currentAbility].spriteSet;
		script_execute(global.MKSS_WeaponList[currentAbility].setupScript);
	}
	
	characterSetup = false;
}
#endregion

#region Gameplay Variables
flashTimerTarget = 4;
flashTimerScript = scr_MKSS_Player_FlashTimer;
shadowAlphaTarget = position_meeting(x,y,obj_MKSS_ShadowArea);
shadowAlpha = shadowAlphaTarget;
shadowAlphaFinal = shadowAlphaTarget;
isPaused = false;
tutorialText = "";
tutorialTextAlpha = 0;
tutorialTextAlphaTarget = 0;
tutorialTextTimer = -1;
hurtElement = MKSS_HurtElements.none;
#endregion

#region Enums
#region Hurt Elements
enum MKSS_HurtElements
{
	none,
	shocked,
	burned,
	frozen,
	
	length
}
#endregion
#endregion

#region State Scripts
playerGetHit = scr_MKSS_Player_GetHit;
playerGetHitObject = scr_MKSS_Player_GetHit_Object;
playerGetHitContact = scr_MKSS_Player_GetHit_Contact;
playerDeath = scr_MKSS_Player_Death;
#endregion