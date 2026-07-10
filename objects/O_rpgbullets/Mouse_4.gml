if position_meeting(mouse_x, mouse_y, O_templatebutton)
{
	if (mouse_check_button_pressed(mb_left))
	{
		if global.flagrpg[3] = false
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
					global.bullets = 3;
				
					audio_play_sound(dogtrill,1,false);
					//setup junk
					if (timesbeenbought = maxtimesbeenbought)
					{
						hasbeenbought = true;
						global.bossunlockcounter ++;
						global.flagrpg[3] = true;
					}
				}
				else
				{
					show_message("you're broke"); //replace this ofc
				}
			}
		}
	}
}

if global.flagrpg[3] = true
{
	sprite_index = spr_bought;
}

mousepressed = false;