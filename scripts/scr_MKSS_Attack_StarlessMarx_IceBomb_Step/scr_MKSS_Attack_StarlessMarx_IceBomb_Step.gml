///@description MKSS - Attack - Starless Marx - Ice Bomb - Step

function scr_MKSS_Attack_StarlessMarx_IceBomb_Step()
{
	if (!localPause)
	{
		#region Detonate
		if (instance_place(x,y - 8,obj_Wall))
		{
			var _dir = 1;
			repeat(2)
			{
				with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					knockbackForce = 1;
					hsp = 6 * _dir;
					vsp = 0;
					sprite_index = spr_MKSS_Attack_StarlessMarx_IceWave;
					mask_index = spr_MKSS_Attack_StarlessMarx_IceWave;
					attackAIStep = scr_MKSS_Attack_StarlessMarx_IceWave_Step;
					destroyOutsideRoom = true;
					destroyAfterCollideWall = false;
					particleTimerMax = 5;
					particleTimer = particleTimerMax;
				}
				
				_dir = -1;
			}
				
			instance_destroy();
		}
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}