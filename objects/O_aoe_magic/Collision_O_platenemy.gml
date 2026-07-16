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
		instance_create_depth
		(
		other.x,
		other.y,
		depth-1,
		O_effectspawner,
		{sprite: S_platenemy, xscale: 1, yscale: 1}
		);
		instance_destroy(other.id);
		
		givemoneyenemy();
	}
}