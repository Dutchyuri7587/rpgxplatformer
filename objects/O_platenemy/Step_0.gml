if place_meeting(x,y-1,O_wall)
{
	xspeed = xspeed*-1;
	movedirection = movedirection*-1;
}

x += xspeed;

var _enemy = instance_place(x,y,O_player_plat);

if (_enemy != noone)
{
	if (bbox_bottom <= _enemy.bbox_top)
	{
		show_message("you killed him :(");
	}
}