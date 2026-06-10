if position_meeting(mouse_x, mouse_y, O_newbutton)
{
	if (mouse_check_button_pressed(mb_left))
	{
		if (hasbeenbought = false)
		{
			mousepressed = true;
			if (global.money >= cost*global.sale) && (mousepressed = true)
			{
				global.money = global.money - cost*global.sale;
				mousepressed = false;
				global.testvar += 1;
				timesbeenbought += 1;
				if (timesbeenbought = maxtimesbeenbought)
				{
					hasbeenbought = true;
					global.bossunlockcounter += 1;
				}
			}
			else
			{
				show_message("you're broke"); //replace this ofc
			}
		}
		else
		{
			show_message("already bought dummy")
		}
	}
}

mousepressed = false;