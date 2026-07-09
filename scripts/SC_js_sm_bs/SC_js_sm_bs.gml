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
	if O_player_plat.invincibilitytime >= 170
	{
		if O_player_plat.face = -1
		{
			x += 2.5;
			O_player_plat.xspeed = 0;
			if (O_player_plat.crushed = true)
			{
				x -= 4.5;
				if (!place_meeting(x,y,O_wall))
				{
					O_player_plat.crushed = false;
				}
			}
		}
		if O_player_plat.face = 1
		{
			x -= 2.5;
			O_player_plat.xspeed = 0;
			if (O_player_plat.crushed = true)
			{
				x += 4.5;
				if (!place_meeting(x,y,O_wall))
				{
					O_player_plat.crushed = false;
				}
			}
		}
	}
}