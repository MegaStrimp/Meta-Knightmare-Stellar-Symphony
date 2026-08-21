if (!destroy)
{
	darkAlpha = min(darkAlpha + darkFade,darkMax);
}
else
{
	darkAlpha -= darkFade;
	if (darkAlpha <= 0) instance_destroy();
}