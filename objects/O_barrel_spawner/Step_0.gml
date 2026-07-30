if hasspawnedenemy = false
{
	instance_create_depth(target_x,target_y,-50,enemytype)
	hasspawnedenemy = true;
	timer = timerframes;
}

if timer > 0
{
	timer--;
	if timer <= 0
	{
		hasspawnedenemy = false;
	}
}