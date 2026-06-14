if position_meeting(mouse_x, mouse_y, O_salesalesale)
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
				global.sale = 0.5
				timesbeenbought += 1;
				audio_play_sound(dogtrill,1,false);
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