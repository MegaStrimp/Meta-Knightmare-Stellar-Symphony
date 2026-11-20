activationScript = function()
{
	var sfx = scr_PlaySfx(snd_MKSS_FoodAppear);
	audio_sound_pitch(sfx,random_range(.95,1.05));
	
	instance_create_depth(x,y,depth,obj_MKSS_Food_PepBrew);
}