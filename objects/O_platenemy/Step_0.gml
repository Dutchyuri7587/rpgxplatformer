if place_meeting(x,y,O_wall)
{
	xspeed *= -1;
	movedirection *= -1;
}

x += xspeed;

if hasbeenhit = true
{
	enemyinvincibilitytime--;
	if enemyinvincibilitytime <= 0
	{
		hasbeenhit = false;
	}
}