if place_meeting(x,y,O_player_plat)
{
	if hasdrained = false
	{
		global.plathp -= drainamount;
		hasdrained = true;
		timer = timerframes;
	}
}

if hasdrained = true
{
	timer--;
	if timer <= 0
	{
		hasdrained = false;
	}
}