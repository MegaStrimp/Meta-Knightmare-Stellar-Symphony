time = clamp(++time,0,moveTime)
switch (progress)
{
	case 0:
		time++
		
		x += hsp
		y += vsp
		
		vsp -= 0.01
	break;
	case 1:
		time++
		
		if (metaKnightHit == false and distance_to_object(obj_MKSS_Player) < 32)
		{
			hsp = sendBackAmnt
			vsp = -3
			metaKnightHit = true
			
			with (obj_Player)
			{
				attackMakeHeavyInvincible = true;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_NimbiaParry_Step);
			}
		}
		
		hsp = clamp(hsp - 0.2,-6,sendBackAmnt)
		vsp = min(0,vsp+0.01)
		
		x += hsp
		y += vsp
	break;
	case 2:
		time++
		if (y < targetY)
		{
			y += vsp
			//x += sine_between(current_time/1000,1,-0.1,0.1)
		}
		//y = lerp(-50,targetY,time/moveTime)
		
	break;
}