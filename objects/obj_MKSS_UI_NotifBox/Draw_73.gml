///@description Draw End

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
var xxWithOffset = xx + (global.gameWidth / 2);
var yyWithOffset = yy + (global.gameHeight / 2) + closeOffset;
var ySize = sprite_get_height(spr_MKSS_UI_NotifBox_Back) * (image_yscale / 2);
var xSize = sprite_get_width(spr_MKSS_UI_NotifBox_Back) * (image_xscale / 2);

var textX = xxWithOffset - xSize + 12;
var textY = yyWithOffset - ySize + 12 + ((image[page] != undefined) * 50);

var imageX = xxWithOffset;
var imageY = yyWithOffset - ySize + 9;
#endregion

#region Overlay
draw_set_alpha(overlayAlpha);
draw_rectangle_color(xx,yy,xx + global.gameWidth,yy + global.gameHeight,c_black,c_black,c_black,c_black,false);
draw_set_alpha(1);
#endregion

#region Back
draw_sprite_ext(spr_MKSS_UI_NotifBox_Back,0,xxWithOffset,yyWithOffset,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
#endregion

#region Mask
scr_DrawMask_Begin();
scr_DrawMask_Mask(spr_MKSS_UI_NotifBox_Mask,0,xxWithOffset,yyWithOffset,image_xscale,image_yscale);

#region Texture
for (var i = -5; i < 6; i++)
{
	draw_sprite(spr_MKSS_UI_NotifBox_Texture,0,xxWithOffset + textureX + (textureWidth * i),yyWithOffset - ySize);
	draw_sprite(spr_MKSS_UI_NotifBox_Texture,0,xxWithOffset - textureX + (textureWidth * i),yyWithOffset + ySize - textureHeight);
}
#endregion

scr_DrawMask_End();
#endregion

#region Image
if (image[page] != undefined)
{
	draw_set_alpha(imageAlpha);
	draw_sprite(image[page],0,imageX,imageY);
	draw_set_alpha(1);
}
#endregion

#region Text
if (text[page] != undefined)
{
	var finalText = scr_String_ReplaceButtonSigns(text[page],upIcon,downIcon,leftIcon,rightIcon,AIcon,BIcon,XIcon,YIcon,LIcon,RIcon,LTIcon,RTIcon,startIcon,selectIcon);
	
	scribble("[" + string(font) + "][alpha," + string(1) + "]" + finalText + "[/alpha][/font]").wrap((sprite_get_width(spr_MKSS_UI_NotifBox_Back) * image_xscale) - 16).draw(textX,textY,textTypist);
}
#endregion

#region Button Hints
if ((textTypist.get_state() == 1) or (text[page] == undefined))
{
	var AIconFinal = "";
	if (AIcon != undefined)  AIconFinal = AIcon;
	var BIconFinal = "";
	if (BIcon != undefined) BIconFinal = BIcon;
	
	if (nextText != undefined) scribble(string(AIconFinal) + " " + nextText).align(fa_right).draw(xxWithOffset + xSize - 2,yyWithOffset + ySize - 9);
	if (backText != undefined) scribble(string(BIconFinal) + " " + backText).draw(xxWithOffset - xSize + 2,yyWithOffset + ySize - 9);
}
#endregion