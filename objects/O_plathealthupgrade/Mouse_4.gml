if position_meeting(mouse_x, mouse_y, O_plathealthupgrade)
{
	if (mouse_check_button_pressed(mb_left))
	{
		if global.flagplat[1] = false
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
				
					//actual functions
					global.plathp += 1;
					global.maxplathp += 1;
				
					audio_play_sound(dogtrill,1,false);
					//setup junk
					if (timesbeenbought = maxtimesbeenbought)
					{
						hasbeenbought = true;
						global.bossunlockcounter ++;
						global.flagplat[1] = true;
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
}

if global.flagplat[1] = true
{
	sprite_index = spr_bought;
}

mousepressed = false;