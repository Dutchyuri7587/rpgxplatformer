if place_meeting(x,y-1,O_player_plat)
{
	O_player_plat.x += (trackspeed*movedirection);
}


if O_player_plat.face = -1
{
	O_player_plat.xspeed = 0;
	if (O_player_plat.crushed = true)
	{
		O_player_plat.x -= 4.5;
		if (!place_meeting(x,y,O_wall))
		{
			O_player_plat.crushed = false;
		}
	}
}
if O_player_plat.face = 1
{
	O_player_plat.xspeed = 0;
	if (O_player_plat.crushed = true)
	{
		O_player_plat.x += 4.5;
		if (!place_meeting(x,y,O_wall))
		{
			O_player_plat.crushed = false;
		}
	}
}