///@description MKSS - Cutscene - Preset - Tutorial Intro

function scr_MKSS_Cutscene_Preset_TutorialIntro()
{
	#region Setup
	canBePaused = false;
	
	cameraOffset = -200;
	cameraOffsetOld = global.camera.yOffset;
	moveCamera = false;
	musicPlayed = false;
	overlayAlpha = 1;
	
	instance_create_depth(0,0,0,obj_MKSS_CameraOffsetController);
	#endregion
	
	#region Step Script
	stepScript = function()
	{
		#region Update Environments & Camera
		with (obj_MKSS_CameraOffsetController) targetYOffset = other.cameraOffset;
		#endregion
		
		if (!localPause)
		{
			#region Overlay
			overlayAlpha = lerp(overlayAlpha,phase < 2,.02);
			#endregion
			#endregion
			
			#region Camera
			if (moveCamera)
			{
				cameraOffset = min(cameraOffsetOld,cameraOffset + 1);
			}
			#endregion
		}
	};
	#endregion
	
	#region Phase Setup Scripts
	phaseSetupScript = 
	[
		function()
		{
			global.hasHud = false;
			global.canGamePause = false;
			global.MKSS_CutsceneStopMovement = true;
			with (obj_Player) clampToView = false;
			with (obj_MKSS_OceanAmbience) instance_destroy();
			
			audio_stop_sound(global.musicPlaying);
			
			phaseTimer = 120;
		},
		function()
		{
			instance_create_depth(0,0,0,obj_MKSS_OceanAmbience);
			
			phaseTimer = 150;
		},
		function()
		{
			scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "iceCreamIsland"]);
			
			musicPlayed = true;
			
			with (instance_create_layer(0,0,"Instances",obj_MKSS_UI_FadingText))
			{
				text = "Made by Strimp's Kitchen";
				disappearTimer = 240;
				xOffset = global.gameWidth / 2;
				yOffset = global.gameHeight / 2;
				halign = fa_center;
				valign = fa_middle;
			}
			
			phaseTimer = 360;
		},
		function()
		{
			with (instance_create_layer(0,0,"Instances",obj_MKSS_UI_FadingText))
			{
				text = "Meta Knightmare Stellar Symphony";
				disappearTimer = 240;
				xOffset = global.gameWidth / 2;
				yOffset = global.gameHeight / 2;
				halign = fa_center;
				valign = fa_middle;
			}
			
			moveCamera = true;
			
			phaseTimer = 120;
		},
		function()
		{
			phaseTimer = 240;
		},
		function()
		{
			global.hasHud = true;
			global.canGamePause = true;
			global.MKSS_CutsceneStopMovement = false;
			
			if (!musicPlayed)
			{
				scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "iceCreamIsland"]);
				
				musicPlayed = true;
			}
			
			cameraOffset = cameraOffsetOld;
			
			with (obj_MKSS_CameraOffsetController) targetYOffset = other.cameraOffset;
			
			with (obj_Player)
			{
				clampToView = true;
				
				scr_MKSS_Player_SetTutorialText("[leftIcon][rightIcon] Walk",300);
			}
			
			if (!instance_exists(obj_MKSS_OceanAmbience)) instance_create_depth(0,0,0,obj_MKSS_OceanAmbience);
			
			instance_destroy();
			
			phaseTimer = -1;
		}
	];
	#endregion
	
	#region Draw Script
	drawScript = function()
	{
		#region Overlay
		draw_set_color(c_black);
		draw_set_alpha(overlayAlpha);
		draw_rectangle(xx,yy,xx + global.gameWidth,yy + global.gameHeight,false);
		draw_set_color(c_white);
		draw_set_alpha(1);
		#endregion
	}
	#endregion
}