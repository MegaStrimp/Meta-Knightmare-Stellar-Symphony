///@description Main

if (!localPause)
{
	if (conditionScript != -1)
	{
		if (script_execute_ext(conditionScript,conditionScriptArgs))
		{
			if (triggerScript != -1) script_execute(triggerScript);
			
			instance_destroy();
		}
	}
}