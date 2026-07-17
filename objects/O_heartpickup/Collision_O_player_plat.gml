if global.plathp < global.maxplathp
{
	global.plathp += heartadded;
	
	instance_create_depth
	(
	x,
	y,
	depth-100,
	O_floatingtext,
	{font: testfont, col: c_red, text: "+" + string(heartadded) + "HP"}
	);
	
	instance_destroy();
}
else if displayedtext = false
{
	displayedtext = true;
	text_timer = text_frames;
	
	instance_create_depth
	(
	x,
	y,
	-1000,
	O_floatingtext,
	{font: testfont, col: c_white, text: "Already at full health"}
	);
	
}
