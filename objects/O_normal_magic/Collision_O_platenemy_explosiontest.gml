if hashitenemy = false
{
	other.hp -= damage;
	hashitenemy = true;
	
	instance_create_depth
	(
	x+20,
	y,
	depth-1,
	O_floatingtext,
	{font: testfont, col: c_white, text: "-"+string(damage*global.attackmultiplier)}
	);
	
	if (other.hp <= 0)
	{	
		givemoneyenemy();
		other.explosiontimer = other.explosionframes;
		other.startcounting = true;
	}
}