if position_meeting(mouse_x, mouse_y, O_retry_button)
{
	if (mouse_check_button_pressed(mb_left))
	{
		global.plathp = global.maxplathp;
		room_goto(O_retry.target_room);
	}	
}