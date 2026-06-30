function enemyjump()
{
		if (O_player_plat.enemyjumpkilltimer > 0)
		{
			// repeatedly set the yspeed to your jumping speed
			O_player_plat.yspeed = O_player_plat.jumpspeed;
			// count down the timer
			O_player_plat.enemyjumpkilltimer -= 1;
		}
}