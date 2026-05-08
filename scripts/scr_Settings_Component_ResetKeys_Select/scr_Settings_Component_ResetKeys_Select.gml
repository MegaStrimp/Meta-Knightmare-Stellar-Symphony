///@description Settings - Component - Reset Keys - Select

function scr_Settings_Component_ResetKeys_Select()
{
	scr_DefaultKeybindings();
	
	var i = 0;
	buttonRemap_KeysText[targetIndex] = input_binding_get("up");
	i += 1;
	buttonRemap_KeysText[targetIndex] = input_binding_get("down");
	i += 1; 
	buttonRemap_KeysText[targetIndex] = input_binding_get("left");
	i += 1;
	buttonRemap_KeysText[targetIndex] = input_binding_get("right");
	i += 1;
	buttonRemap_KeysText[targetIndex] = input_binding_get("A");
	i += 1;
	buttonRemap_KeysText[targetIndex] = input_binding_get("B");
	i += 1;
	buttonRemap_KeysText[targetIndex] = input_binding_get("X");
	i += 1;
	buttonRemap_KeysText[targetIndex] = input_binding_get("Y");
	i += 1;
	buttonRemap_KeysText[targetIndex] = input_binding_get("L");
	i += 1;
	buttonRemap_KeysText[targetIndex] = input_binding_get("R");
	i += 1;
	buttonRemap_KeysText[targetIndex] = input_binding_get("LT");
	i += 1;
	buttonRemap_KeysText[targetIndex] = input_binding_get("RT");
	i += 1;
	buttonRemap_KeysText[targetIndex] = input_binding_get("start");
	i += 1;
	buttonRemap_KeysText[targetIndex] = input_binding_get("select");
}