if place_meeting(x,y-3,O_wall)
{
	instance_destroy();
}

if !place_meeting(x,y+1,O_wall)
{
	y += velocity;
	if (y< O_wall.bbox_top)
	{
		y -= 1;
	}
}

x += xspeed;