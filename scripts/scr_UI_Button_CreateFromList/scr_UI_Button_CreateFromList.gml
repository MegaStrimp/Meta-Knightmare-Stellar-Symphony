///@description UI - Button - Create From List

function scr_UI_Button_CreateFromList(targetID,targetX,targetY,targetDepth,targetList)
{
	scr_UI_Button_Create(targetID,targetX,targetY,targetDepth,targetList.sprite,targetList.setupScript,targetList.triggerScript,targetList.baseScript,targetList.drawScript,targetList.neighborLeft,targetList.neighborRight,targetList.neighborUp,targetList.neighborDown);
}