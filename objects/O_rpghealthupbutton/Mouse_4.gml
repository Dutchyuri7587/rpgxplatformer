if position_meeting(mouse_x, mouse_y, O_rpghealthupbutton)
{
	if (mouse_check_button_pressed(mb_left))
	{
		if global.flagrpg[1] = false
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
					global.party[0].hp += 25; // je moet de [0] doe anders crashed het
					global.party[0].maxhp += 25;
				
					audio_play_sound(dogtrill,1,false);
					//setup junk
					if (timesbeenbought = maxtimesbeenbought)
					{
						global.flagrpg[1] = true
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
}

if global.flagrpg[1] = true
{
	sprite_index = spr_bought;
}

mousepressed = false;