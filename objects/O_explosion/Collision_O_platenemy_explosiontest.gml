if !hashit
{
	other.enemyinvincibilitytime = other.enemyinvincibilityframes;
	other.hasbeenhit = true;
	hashit = true;
	other.hp -= enemydamage;
	
	instance_create_depth
	(
	x+20,
	y,
	depth-100,
	O_floatingtext,
	{font: testfont, col: c_white, text: "-"+string(damage)}
	);
	
	if other.hp <= 0
	{
		givemoneyenemy();
	}
}