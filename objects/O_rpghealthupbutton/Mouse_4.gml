if position_meeting(mouse_x, mouse_y, O_rpghealthupbutton)
{
	if (mouse_check_button_pressed(mb_left))
	{
		if (hasbeenbought = false)
		{
			mousepressed = true;
			if (global.money >= cost*global.sale) && (mousepressed = true)
			{
				//setup junk
				global.money -= (cost*global.sale);
				mousepressed = false;
				timesbeenbought += 1;
				
				//actual button function
				global.rpghealth += 25
				global.rpgmaxhealth += 25
				
				audio_play_sound(dogtrill,1,false);
				//setup junk
				if (timesbeenbought = maxtimesbeenbought)
				{
					hasbeenbought = true;
					global.bossunlockcounter ++;
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