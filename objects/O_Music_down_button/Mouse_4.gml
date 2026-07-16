if position_meeting(mouse_x, mouse_y, O_Music_down_button)
{
	if (mouse_check_button_pressed(mb_left))
	{
		global.mastervolume -= 0.10
		if global.mastervolume < 0.00
		{
			global.mastervolume = 0.00
		}
	}
}