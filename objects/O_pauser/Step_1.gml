if room != R_Title_screen
{
	if keyboard_check_pressed(ord("P"))
	{
		paused = !paused;
		if paused == false
		{
			instance_activate_all();
			surface_free(paused_surface);
			paused_surface = -1;
		}
	}
	if paused == true
	{
		alarm[0]++;
		alarm[1]++;
	}
}