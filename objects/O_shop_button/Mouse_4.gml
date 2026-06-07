if position_meeting(mouse_x, mouse_y, O_shop_button)
{
	if (mouse_check_button_pressed(mb_left))
	{
		mousepressed = true;
		if (global.money >= cost) && (mousepressed = true)
		{
			global.money = global.money - cost;
			mousepressed = false;
			if (global.boughtsomething = 0) || (global.boughtsomething = 1)
			{
				global.boughtsomething = 1;
			}
			
		}
		else
		{
		show_message("you're broke");
		}
	}
}

mousepressed = false;
