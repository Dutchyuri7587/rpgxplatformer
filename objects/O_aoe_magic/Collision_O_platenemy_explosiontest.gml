if hashitenemy = false
{
	other.hp -= damage;
	
	if !hasshowntext
	{
		instance_create_depth
		(
		x+20,
		y,
		depth-1,
		O_floatingtext,
		{font: testfont, col: c_white, text: "-"+string(damage*global.attackmultiplier)}
		);
	}
	
	hasshowntext = true;
	texttimer = textframes;
	
	if (other.hp <= 0)
	{	
		givemoneyenemy();
		other.explosiontimer = other.explosionframes;
		other.startcounting = true;
	}
}