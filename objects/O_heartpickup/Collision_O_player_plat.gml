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
