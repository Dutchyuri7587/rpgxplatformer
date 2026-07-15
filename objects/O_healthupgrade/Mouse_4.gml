if position_meeting(mouse_x, mouse_y, O_healthupgrade)
{
	if (mouse_check_button_pressed(mb_left))
	{
		if global.flagshop[2] = false
		{
			mousepressed = true;
			if (global.money >= cost*global.sale) && (mousepressed = true)
			{
				//setup junk
				global.money -= (cost*global.sale);
				mousepressed = false;
				timesbeenbought += 1;
				
				//actual functions
				global.plathp++;
				global.maxplathp++;
				
				global.party[0].maxhp += 25;
				global.party[0].hp += 25;
				
				
				//sfx
				audio_play_sound(dogtrill,1,false);
				//setup junk
				if (timesbeenbought = maxtimesbeenbought)
				{
					hasbeenbought = true;
					global.bossunlockcounter ++;
					global.flagshop[2] = true;
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

if global.flagshop[2] = true
{
	sprite_index = spr_bought;
}

mousepressed = false;