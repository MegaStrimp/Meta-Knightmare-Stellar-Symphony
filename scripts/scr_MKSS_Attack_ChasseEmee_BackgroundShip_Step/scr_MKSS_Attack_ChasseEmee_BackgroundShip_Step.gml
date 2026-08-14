///@description MKSS - Attack - Chasse Emee - Background Ship - Step

function scr_MKSS_Attack_ChasseEmee_BackgroundShip_Step()
{
	if (!localPause)
	{
		#region Cannon Shots
		if (shotTimer != -1)
		{
			shotTimer = max(shotTimer - speedMultFinal,0);
			if (shotTimer == 0)
			{
				var sfx = scr_PlaySfx(snd_MKSS_BlockBreak);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				scr_MKSS_ParticleSet_BlockBreak1(x,y,depth - 1);
				
				var playerDir = 1;
				if (obj_Player.x < x) playerDir = -1;
				
				with (instance_create_depth(x,y,depth - 4,obj_MKSS_Attack))
				{
					owner = other.owner;
					isEnemy = true;
					dmg = 1;
					sprite_index = spr_MKSS_Attack_ChasseEmee_BigCannonball_BackgroundGreen;
					mask_index = spr_MKSS_Attack_ChasseEmee_BigCannonball_Background;
					hsp = random_range(0,5) * playerDir;
					if (point_distance(x,0,obj_Player.x,0) <= 24) hsp = 0;
					vsp = -4;
					destroyOutsideRoom = false;
					scr_MKSS_Attack_ChasseEmee_BigCannonball_Setup();
					scr_MKSS_UI_ParryIndicator_Create(x,y,depth - 1,20,,id);
					parryAttackIndex = global.MKSS_AttackIDs[? "metaKnight_ParryCannonball"];
				}
				
				shotTimer = irandom_range(shotTimerMaxMin,shotTimerMaxMax);
			}
		}
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}