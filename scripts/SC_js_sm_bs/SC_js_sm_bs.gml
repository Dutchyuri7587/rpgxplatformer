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

function playerhitkb()
{
	if invincibilitytime >= 170
	{
		if face = -1
		{
			x += 2.5;
			xspeed = 0;
			if (crushed = true)
			{
				x -= 4.5;
				if (!place_meeting(x,y,O_wall))
				{
					crushed = false;
				}
			}
		}
		if face = 1
		{
			x -= 2.5;
			xspeed = 0;
			if (crushed = true)
			{
				x += 4.5;
				if (!place_meeting(x,y,O_wall))
				{
					crushed = false;
				}
			}
		}
	}
}