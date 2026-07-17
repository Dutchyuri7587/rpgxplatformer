if hashitenemy = false
{
	other.hp -= damage;
	
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
		{sprite: S_platenemy_catbig, xscale: other.effectxscale, yscale: other.effectyscale}
		);
		instance_destroy(other.id);
		
		givemoneyenemy();
	}
}