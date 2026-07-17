if place_meeting(x,y+4,O_wall)
{
	if !place_meeting(x-9, y+4, O_wall)
	{
		xspeed *= -1;
		movedirection *= -1;
	}
	if !place_meeting(x+9, y+4, O_wall)
	{
		xspeed *= -1;
		movedirection *= -1;
	}
}

if place_meeting(x,y+4,O_semisolidwall)
{
	if !place_meeting(x-9, y+4, O_semisolidwall) || place_meeting(x,y+4,O_wall)
	{
		xspeed *= -1;
		movedirection *= -1;
	}
	if !place_meeting(x+9, y+4, O_semisolidwall) || place_meeting(x,y+4,O_wall)
	{
		xspeed *= -1;
		movedirection *= -1;
	}
}