if position_meeting(mouse_x, mouse_y, O_Xbutton)
{
	if (mouse_check_button_pressed(mb_left))
	{
		instance_deactivate_object(O_settingsmenu);
		instance_deactivate_object(O_Xbutton);
		instance_deactivate_object(O_Music_down_button);
		instance_deactivate_object(O_Music_up_button);
		instance_deactivate_object(O_soundimage);
		instance_activate_object(O_Mmenustart);
	}
}