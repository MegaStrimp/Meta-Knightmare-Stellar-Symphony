///@description Settings - Component - Button Remap - Select

function scr_Settings_Component_ButtonRemap_Select(targetRemappedKey,targetKeyIndex)
{
	targetKey = targetRemappedKey;
	targetIndex = targetKeyIndex;
	
	input_binding_scan_start(function(newBinding)
	{
		input_binding_set_safe(targetKey,newBinding,0);
		buttonRemap_KeysText[0] = input_binding_get(targetKey);
		
		var i = 0;
		buttonRemap_KeysText[i] = input_binding_get("up");
		i += 1;
		buttonRemap_KeysText[i] = input_binding_get("down");
		i += 1; 
		buttonRemap_KeysText[i] = input_binding_get("left");
		i += 1;
		buttonRemap_KeysText[i] = input_binding_get("right");
		i += 1;
		buttonRemap_KeysText[i] = input_binding_get("A");
		i += 1;
		buttonRemap_KeysText[i] = input_binding_get("B");
		i += 1;
		buttonRemap_KeysText[i] = input_binding_get("X");
		i += 1;
		buttonRemap_KeysText[i] = input_binding_get("Y");
		i += 1;
		buttonRemap_KeysText[i] = input_binding_get("L");
		i += 1;
		buttonRemap_KeysText[i] = input_binding_get("R");
		i += 1;
		buttonRemap_KeysText[i] = input_binding_get("LT");
		i += 1;
		buttonRemap_KeysText[i] = input_binding_get("RT");
		i += 1;
		buttonRemap_KeysText[i] = input_binding_get("start");
		i += 1;
		buttonRemap_KeysText[i] = input_binding_get("select");
		
		targetKey = "";
	});
}