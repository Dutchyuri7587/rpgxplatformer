if (bbox_bottom-4 <= other.bbox_top+2)
{
	other.enemyinvincibilitytime = other.enemyinvincibilityframes;
	other.hasbeenhit = true;
	enemyjump();
	other.hp -= damage*global.attackmultiplier;
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
else if (!other.hasbeenhit && !gothitplayer)
{
	global.plathp -= other.damage;
	gothitplayer = true;
    invincibilitytime = invincibilityframes;
}