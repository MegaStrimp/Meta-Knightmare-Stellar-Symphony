///@description Draw

if (drawScript == undefined)
{
	draw_self();
}
else if (!maskDrawScript)
{
	script_execute(drawScript);
}