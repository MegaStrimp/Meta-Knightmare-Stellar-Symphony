/// @description Insert description here
// You can write your code in this editor

scale = lerp(scale,scaleTarget,.1); 

image_xscale = scale;
image_yscale = scale;

if (mouse_check_button_pressed(mb_left)) scaleTarget = 1.5;
if (mouse_check_button_pressed(mb_right)) scaleTarget = 0;