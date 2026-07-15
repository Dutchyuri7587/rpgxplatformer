if position_meeting(mouse_x, mouse_y, O_saleupgrade)
{
	if (mouse_check_button_pressed(mb_left))
	{
		if global.flagshop[99] = false
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
					global.sale = 0.5;
				
					audio_play_sound(dogtrill,1,false);
					//setup junk
					if (timesbeenbought = maxtimesbeenbought)
					{
						hasbeenbought = true;
						global.bossunlockcounter ++;
						global.flagshop[99] = true
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

if global.flagshop[99] = true
{
	sprite_index = spr_bought;
}

mousepressed = false;