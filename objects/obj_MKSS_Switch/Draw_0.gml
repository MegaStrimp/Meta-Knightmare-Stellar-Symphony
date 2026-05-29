///@description Draw

#region Aura
if (hasAura) draw_sprite(spr_MKSS_Particle_Aura_1,0,x,y);
#endregion

#region Draw Self
draw_self();
#endregion

#region Text
scribble("[fnt_Advance_Small]" + text + "[/font]").wrap(48).align(fa_center,fa_bottom).draw(x + 8,y - 4);
#endregion