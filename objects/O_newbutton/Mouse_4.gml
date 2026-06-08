if position_meeting(mouse_x, mouse_y, O_newbutton)
{
	if (mouse_check_button_pressed(mb_left))
	{
		if (hasbeenbought = false)
		{
			mousepressed = true;
			if (global.money >= cost) && (mousepressed = true)
			{
				global.money = global.money - cost;
				mousepressed = false;
				global.testvar += 1;
				timesbeenbought += 1;
				if (timesbeenbought = maxtimesbeenbought)
				{
				hasbeenbought = true;
				}
			}
			else
			{
				show_message("you're broke");
			}
		}
		else
		{
			show_message("already bought dummy")
		}
	}
}

mousepressed = false;
