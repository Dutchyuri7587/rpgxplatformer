if !place_meeting(x-9,y+2,O_wall) || !place_meeting(x+9,y+2,O_wall)
{
	xspeed *= -1;
	movedirection *= -1;
}