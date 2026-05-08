///@description MKSS - Set Flavor Text

function scr_MKSS_SetFlavorText()
{
	flavorTextArray =
	[
	"Null... ?",
	"Stars Above!",
	"Heavens Divide!",
	"Stellar!",
	"Ultra Deluxe!",
	"Fueled by Coffee!",
	"Cheese!",
	"Knightmarish!",
	"Strimps Were Harmed Making This Game!",
	"Dance With Destiny!",
	"Sing You The Traitor's Song!",
	"Requiem, Oh!",
	"Also Try Waddle Knight!",
	"Also Try Kirby ~ Soft & Wet!",
	"Also Try Kirby's Dream Land Plus!",
	"This Is An Illusion!",
	"Open Up Your Eyes!",
	"Watch The Sky!",
	"Quick-Switch!",
	"The Cosmic Swordsbender!",
	"Maybe I'll Find Myself Smiling On That Starry Shore!",
	"When The Stars Smile At Moon!",
	"Disturbing The Peace!",
	"Look Into My Eyes!",
	"Do Not Make Me!",
	"Stay Away From Me!"
	];
	
	var flavorText = flavorTextArray[irandom_range(0,array_length(flavorTextArray) - 1)];
	flavorTextArray = -1;
	
	return flavorText;
}