if position_meeting(mouse_x, mouse_y, O_Mmenusettings)
{
	if (mouse_check_button_pressed(mb_left))
	{
		instance_activate_object(O_settingsmenu);
		instance_activate_object(O_Xbutton);
		instance_activate_object(O_Music_down_button);
		instance_activate_object(O_Music_up_button);
		instance_activate_object(O_soundimage);
		instance_deactivate_object(O_Mmenustart);
	}
}