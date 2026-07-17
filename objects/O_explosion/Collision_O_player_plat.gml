if !hashit
{
	other.invincibilitytime = other.invincibilityframes;
	other.gothitplayer = true;
	hashit = true;
	global.plathp -= damage;
	
	instance_create_depth
	(
	x+20,
	y,
	depth-100,
	O_floatingtext,
	{font: testfont, col: c_red, text: "-"+string(damage)}
	);
	
	playerhitkb();
}

