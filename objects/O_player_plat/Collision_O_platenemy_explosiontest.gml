
	if (bbox_bottom-4 <= other.bbox_top+2)
	{
			other.enemyinvincibilitytime = other.enemyinvincibilityframes;
	other.hasbeenhit = true;
		enemyjump();
		other.hits += 1;
		
		if (other.hits >= other.maxhits)
		{
			instance_create_depth(x,y, -9999999, O_explosion);
			instance_destroy(other.id);
		}

	}
	else if (!other.hasbeenhit && !gothitplayer)
{
	hp -= other.damage;
	gothitplayer = true;
    invincibilitytime = invincibilityframes;
}