///@description Draw

#region Event Inherited
event_inherited();
#endregion

#region Big Star
draw_sprite(spr_MKSS_Particle_BigStar_Yellow,bigStarIndex,x + 8,y - 2);
#endregion

#region Text
scribble("[fnt_Advance_Small]" + text + "[/font]").wrap(48).align(fa_center,fa_bottom).draw(x + 8,y - 4);
#endregion