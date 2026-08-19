///@description MKSS - Cutscene - Preset - Halberd Barrier

function scr_MKSS_Cutscene_Preset_HalberdBarrier()
{
	#region Setup
	bossSpawned = false;
	musicPlayed = false;
	
	cameraXOffset = -48;
	cameraYOffset = 128;
	cameraXOffsetOld = global.camera.xOffset;
	cameraYOffsetOld = global.camera.yOffset;
	
	instance_create_depth(0,0,0,obj_MKSS_CameraOffsetController);
	#endregion
	
	#region Step Script
	stepScript = function()
	{
		#region Update Environments & Camera
		with (obj_MKSS_CameraOffsetController)
		{
			targetXOffset = other.cameraXOffset;
			xOffset = other.cameraXOffset;
			targetYOffset = other.cameraYOffset;
			yOffset = other.cameraYOffset;
		}
		#endregion
		
		if (!localPause)
		{
			
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
			
			with (obj_Player)
			{
				clampToView = false;
			}
			
			global.MKSS_BarrierIndex = global.MKSS_BarrierIndexTarget;
			
			scr_MKSS_SaveData(global.selectedSave);
			
			scr_Camera_FollowObject(obj_MKSS_HalberdBarrier);
			
			phaseTimer = 30;
		},
		function()
		{
			with (obj_MKSS_HalberdBarrier)
			{
				targetX = barrierX[global.MKSS_BarrierIndex];
			}
			
			phaseTimer = 210;
		},
		function()
		{
			global.hasHud = true;
			global.canGamePause = true;
			global.MKSS_CutsceneStopMovement = false;
			
			cameraXOffset = cameraXOffsetOld;
			cameraYOffset = cameraYOffsetOld;
			
			with (obj_MKSS_CameraOffsetController)
			{
				targetXOffset = other.cameraXOffset;
				xOffset = other.cameraXOffset;
				targetYOffset = other.cameraYOffset;
				yOffset = other.cameraYOffset;
			}
			
			with (obj_MKSS_HalberdBarrier)
			{
				targetX = barrierX[global.MKSS_BarrierIndex];
				x = barrierX[global.MKSS_BarrierIndex];
			}
			
			with (obj_Player)
			{
				clampToView = true;
				
				scr_Camera_FollowObject(id,cameraXOffset + global.hudCameraXOffset,cameraYOffset + global.hudCameraYOffset);
			}
			
			instance_destroy();
			
			phaseTimer = -1;
		}
	];
	#endregion
}