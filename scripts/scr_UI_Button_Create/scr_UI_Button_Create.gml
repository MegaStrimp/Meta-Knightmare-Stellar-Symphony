///@description UI - Button - Create

function scr_UI_Button_Create(targetID,targetX,targetY,targetDepth,targetSprite,targetSetupScript = undefined,targetTriggerScript = undefined,targetBaseScript = undefined,targetDrawScript = undefined,targetNeighborLeft = undefined,targetNeighborRight = undefined,targetNeighborUp = undefined,targetNeighborDown = undefined)
{
	with (instance_create_depth(targetX,targetY,targetDepth,obj_UI_Button))
	{
		ID = targetID;
		sprite_index = targetSprite;
		mask_index = targetSprite;
		triggerScript = targetTriggerScript;
		baseScript = targetBaseScript;
		drawScript = targetDrawScript;
		neighborLeft = targetNeighborLeft;
		neighborRight = targetNeighborRight;
		neighborUp = targetNeighborUp;
		neighborDown = targetNeighborDown;
		
		if (targetSetupScript != undefined) script_execute(targetSetupScript);
	}
}