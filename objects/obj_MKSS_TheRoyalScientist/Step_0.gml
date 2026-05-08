///@description Main

#region Activate
if ((alphaTarget == 1) and (distance_to_object(obj_Player) <= 36))
{
	scr_PlaySfx(snd_MKSS_SecretDisappear);
	alphaTarget = -1;
	image_index = 1;
}
#endregion

#region Alpha
image_alpha = clamp(image_alpha + (alphaTarget * .02),0,1);
if (image_alpha == 0) instance_destroy();
#endregion