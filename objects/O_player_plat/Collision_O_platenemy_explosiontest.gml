if (bbox_bottom-4 <= other.bbox_top+2)
{
	other.enemyinvincibilitytime = other.enemyinvincibilityframes;
	other.hasbeenhit = true;
	enemyjump();
	other.hits += 1;
		
	if (other.hits >= other.maxhits)
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