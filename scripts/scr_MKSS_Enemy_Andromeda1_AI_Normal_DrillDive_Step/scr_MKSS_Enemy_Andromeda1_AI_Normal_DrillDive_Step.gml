///@description MKSS - Enemy - Andromeda 1 - AI - Normal - Drill Dive - Step

function scr_MKSS_Enemy_Andromeda1_AI_Normal_DrillDive_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Andromeda - Drill Dive";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Move Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Dril Prepare Timer
		attackStateTimerMax[i] = 120;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Drill Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Drill Ground Timer
		attackStateTimerMax[i] = 50;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Drill Finish Timer
		attackStateTimerMax[i] = 35;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 50;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Drill Dive Variables
		drillFront = -1;
		drillBack = -1;
		drill = -1;
		
		drillTrackSpeed = 1.5;
		drillSpeed = 6;
		
		yStart = ystart;
		yTarget = -80;
		yGround = 216;
		yReset = 160;
		
		particleTimerMax = 3;
		particleTimer = particleTimerMax;
		
		xLimit = 48;
		#endregion
		
		#region Drill Dive Start
		sprite_index = spriteSet.sprIdle;
		image_index = 0;
		
		arm[0] = true;
		arm[1] = true;
		arm[2] = true;
		arm[3] = true;
		
		armLT.sprite_index = spriteSet.sprArmLT_SwordAppear;
		armLT.image_index = 0;
		armLT.depth = depth - 4;
		
		armRT.sprite_index = spriteSet.sprArmRT_SwordAppear;
		armRT.image_index = 0;
		armRT.depth = depth - 4;
		#endregion
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Friction
		var decelFinal = decelSlash * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		vsp = scr_Entity_Friction(vsp,decelFinal);
		#endregion
		
		#region Attack States
		switch (attackState)
		{
			#region Move
			case 0:
			if (y > yTarget) vsp = -3;
			else vsp = 0;
			
			if (attackStateTimer[attackState] == -1) or (y <= yTarget)
			{
				vsp = 0;
				
				x = obj_Player.x;
				y = yTarget;
				
				armLB.image_alpha = 0;
				armRB.image_alpha = 0;
				armLT.image_alpha = 0;
				armRT.image_alpha = 0;
				
				with (instance_create_depth(x,y,depth - 3,obj_MKSS_Attack))
				{
					owner = other.id;
					isEnemy = true;
					dmg = 8;
					sprite_index = spr_MKSS_Attack_Andromeda1_DrillTopFront;
					mask_index = spr_MKSS_Attack_Andromeda1_DrillTopFront;
					attackAIStep = scr_MKSS_Attack_Andromeda1_RapidSlash_Step;
					image_xscale = other.image_xscale;
					other.drillFront = id;
				}
				with (instance_create_depth(x,y,depth + 3,obj_MKSS_Attack))
				{
					owner = other.id;
					isEnemy = true;
					dmg = 8;
					sprite_index = spr_MKSS_Attack_Andromeda1_DrillTopBack;
					mask_index = spr_MKSS_Attack_Andromeda1_DrillTopBack;
					attackAIStep = scr_MKSS_Attack_Andromeda1_RapidSlash_Step;
					image_xscale = other.image_xscale;
					other.drillBack = id;
				}
				with (instance_create_depth(x,y,depth - 3,obj_MKSS_Attack))
				{
					owner = other.id;
					isEnemy = true;
					dmg = 8;
					sprite_index = spr_MKSS_Attack_Andromeda1_DrillBottom;
					mask_index = spr_MKSS_Attack_Andromeda1_DrillBottom;
					attackAIStep = scr_MKSS_Attack_Andromeda1_RapidSlash_Step;
					image_xscale = other.image_xscale;
					other.drill = id;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Drill Prepare
			case 1:		
			particleTimer = max(particleTimer - speedMultFinal,0);
			if (particleTimer == 0)
			{
				var _amount = 4;
				var _size = lerp(0,yGround,1/_amount);
				var i = 0;
				repeat(_amount)
				{
					repeat(irandom_range(5,8)) scr_MKSS_ParticleSet_Common(x + irandom_range(-24,24),irandom_range(_size * i,_size * (i + 1)),spr_MKSS_Particle_SpecialSparkle_Blue);
					
					i++;
				}
				
				particleTimer = particleTimerMax;
			}
			
			var _range = 8;
			if (point_distance(x,0,obj_Player.x,0) < _range) hsp = 0;
			else
			{
				dirX = scr_MKSS_Enemy_DirTarget();
				
				hsp = drillTrackSpeed * dirX;
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				hsp = 0;
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				attackState++;
			}
			break;
			#endregion
			
			#region Drill
			case 2:
			particleTimer = max(particleTimer - speedMultFinal,0);
			if (particleTimer == 0)
			{
				var _amount = 4;
				var _size = lerp(0,yGround,1/_amount);
				var i = 0;
				repeat(_amount)
				{
					repeat(irandom_range(5,8)) scr_MKSS_ParticleSet_Common(x + irandom_range(-24,24),irandom_range(_size * i,_size * (i + 1)),spr_MKSS_Particle_SpecialSparkle_Blue);
					
					i++;
				}
				
				particleTimer = particleTimerMax;
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				attackState++;
			}
			break;
			#endregion
			
			#region Drill Ground
			case 3:
			vsp = drillSpeed;
			
			if (attackStateTimer[attackState] == -1) or (y >= yGround - 24)
			{
				with (instance_create_depth(x,224,depth + 10,obj_MKSS_Attack))
				{
					owner = other.id;
					isEnemy = true;
					dmg = -1;
					targetDmg = 8;
					sprite_index = spr_MKSS_Attack_Andromeda1_BrokenGround;
					mask_index = spr_MKSS_Attack_Andromeda1_BrokenGround;
					scr_MKSS_Attack_Andromeda1_BrokenGround_Setup();
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Drill Finish
			case 4:
			vsp = .1;
			
			shakeX = 2;
			shakeY = 1;
			
			particleTimer = max(particleTimer - speedMultFinal,0);
			if (particleTimer == 0)
			{
				repeat(irandom_range(2,4)) scr_MKSS_ParticleSet_HalberdRubble(x + irandom_range(-16,16),224 + irandom_range(0,6));
					
				particleTimer = particleTimerMax;
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				armLB.image_alpha = 1;
				armRB.image_alpha = 1;
				armLT.image_alpha = 1;
				armRT.image_alpha = 1;
				
				arm[0] = false;
				arm[1] = false;
				arm[2] = false;
				arm[3] = false;
				
				with (drillFront) instance_destroy();
				with (drillBack) instance_destroy();
				with (drill) instance_destroy();
				
				vsp = -6;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 5:
			y = max(y,yReset);
			
			if (attackStateTimer[attackState] == -1)
			{
				y = yReset;
				vsp = 0;
				
				scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
			}
			break;
			#endregion
		}
		#endregion
		
		#region Collision
		scr_Component_SetPosition(hsp,vsp);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}