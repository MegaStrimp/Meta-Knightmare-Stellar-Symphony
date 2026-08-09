///@description Draw

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
#endregion

#region Draw Self
draw_self();
#endregion

#region Surface
scr_DrawMask_Begin();

scr_DrawMask_Mask(spr_MKSS_HalberdBarrier_Mask,image_index,,,image_xscale,image_yscale,);

draw_surface(obj_MKSS_Surface_Planetarium.drawSurface,xx,yy);

scr_DrawMask_End();
#endregion