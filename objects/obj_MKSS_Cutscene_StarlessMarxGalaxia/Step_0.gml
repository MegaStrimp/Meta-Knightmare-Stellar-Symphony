y += 4

if (place_meeting(x,y,obj_MKSS_Enemy_StarlessMarx) and cut == false)
{
	cut = true
	scr_Enemy_ChangeState_Step(obj_MKSS_Enemy_StarlessMarx,scr_MKSS_Enemy_StarlessMarx_AI_Cutscene_MDDeath_Step)
}