if (bbox_bottom-4 <= other.bbox_top+2)
{
	other.enemyinvincibilitytime = other.enemyinvincibilityframes;
	other.hasbeenhit = true;
	enemyjump();
	other.hits += 1;
	
	instance_create_depth
	(
	x,
	y,
	depth-1,
	O_effectspawner,
	{sprite: S_platenemy_stage3, xscale: 1, yscale: 1}
	);
		
	if (other.hits >= other.maxhits)
	{
		instance_destroy(other.id);
		
		givemoneyenemy();
	}
}
else if (!other.hasbeenhit && !gothitplayer)
{
	global.plathp -= other.damage;
	gothitplayer = true;
    invincibilitytime = invincibilityframes;
}