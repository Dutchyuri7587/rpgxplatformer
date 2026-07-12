if position_meeting(mouse_x, mouse_y, O_Mmenusettings)
{
	if (mouse_check_button_pressed(mb_left))
	{
		instance_create_depth(x,y,-1000, O_settingsmenu)
	}
}