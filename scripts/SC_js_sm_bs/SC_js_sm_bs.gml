function enemyjump()
{
	enemyjumpkilltimer = enemyjumpkillframes;
	if (enemyjumpkilltimer > 0)
	{
		// repeatedly set the yspeed to your jumping speed
		yspeed = enemykilljumpspeed;
		// count down the timer
		enemyjumpkilltimer -= 1;
	}
}