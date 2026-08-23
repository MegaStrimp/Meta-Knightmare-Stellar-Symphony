///@description Draw GUI End

#region Draw Virtual Buttons
if (global.isMobile)
{
	var alpha = .5;
	var thumbstickX = global.DL1_VirtualButton_Thumbstick.get_x();
	var thumbstickY = global.DL1_VirtualButton_Thumbstick.get_y();
	
	draw_sprite_ext(spr_MKSS_UI_VirtualButton_Thumbstick_Border,0,MKSS_Base_VirtualButton_Thumbstick_X,MKSS_Base_VirtualButton_Thumbstick_Y,1,1,0,c_white,alpha);
	draw_sprite_ext(spr_MKSS_UI_VirtualButton_Thumbstick_Middle,0,MKSS_Base_VirtualButton_Thumbstick_X + (thumbstickX * INPUT_VIRTUAL_BUTTON_MIN_THRESHOLD),MKSS_Base_VirtualButton_Thumbstick_Y + (thumbstickY * INPUT_VIRTUAL_BUTTON_MIN_THRESHOLD),1,1,0,c_white,alpha);
	
	draw_sprite_ext(spr_MKSS_UI_VirtualButton_A,0,MKSS_Base_VirtualButton_A_X1,MKSS_Base_VirtualButton_A_Y1,1,1,0,c_white,alpha);
	draw_sprite_ext(spr_MKSS_UI_VirtualButton_B,0,MKSS_Base_VirtualButton_B_X1,MKSS_Base_VirtualButton_B_Y1,1,1,0,c_white,alpha);
	draw_sprite_ext(spr_MKSS_UI_VirtualButton_X,0,MKSS_Base_VirtualButton_X_X1,MKSS_Base_VirtualButton_X_Y1,1,1,0,c_white,alpha);
	draw_sprite_ext(spr_MKSS_UI_VirtualButton_Y,0,MKSS_Base_VirtualButton_Y_X1,MKSS_Base_VirtualButton_Y_Y1,1,1,0,c_white,alpha);
	
	draw_sprite_ext(spr_MKSS_UI_VirtualButton_L,0,MKSS_Base_VirtualButton_L_X1,MKSS_Base_VirtualButton_L_Y1,1,1,0,c_white,alpha);
	draw_sprite_ext(spr_MKSS_UI_VirtualButton_LT,0,MKSS_Base_VirtualButton_LT_X1,MKSS_Base_VirtualButton_LT_Y1,1,1,0,c_white,alpha);
	draw_sprite_ext(spr_MKSS_UI_VirtualButton_R,0,MKSS_Base_VirtualButton_R_X1,MKSS_Base_VirtualButton_R_Y1,1,1,0,c_white,alpha);
	draw_sprite_ext(spr_MKSS_UI_VirtualButton_RT,0,MKSS_Base_VirtualButton_RT_X1,MKSS_Base_VirtualButton_RT_Y1,1,1,0,c_white,alpha);
	
	draw_sprite_ext(spr_MKSS_UI_VirtualButton_Start,0,MKSS_Base_VirtualButton_Start_X1,MKSS_Base_VirtualButton_Start_Y1,1,1,0,c_white,alpha);
	draw_sprite_ext(spr_MKSS_UI_VirtualButton_Select,0,MKSS_Base_VirtualButton_Select_X1,MKSS_Base_VirtualButton_Select_Y1,1,1,0,c_white,alpha);
}
#endregion