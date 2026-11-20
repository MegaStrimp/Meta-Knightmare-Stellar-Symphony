///@description MKSS - Condition Checker - Condition - NumberOfObjects

function scr_MKSS_ConditionChecker_Condition_NumberOfObjects(targetObject,targetNum,targetSign = 0)
{
	/*
	Sign
	0 - equal
	1 - smaller
	2 - larger
	*/
	
	switch (targetSign)
	{
		default:
		return (instance_number(targetObject) == targetNum);
		
		case 1:
		return (instance_number(targetObject) <= targetNum);
		
		case 2:
		return (instance_number(targetObject) >= targetNum);
	}
}