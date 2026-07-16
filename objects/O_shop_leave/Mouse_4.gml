if position_meeting(mouse_x, mouse_y, O_shop_button)
{
	if (mouse_check_button_pressed(mb_left))
	{
		room_goto(target_room)
		audio_play_sound(dogtrill,1,false);
	}
}