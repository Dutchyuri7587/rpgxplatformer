hasbeenbought = false;
cost = 1;
mousepressed = false;
timesbeenbought = 0;
maxtimesbeenbought = 1;

spr_unbought = S_button_shop;
spr_bought = S_button_shop;

if global.flagshop[1] = true
{
	sprite_index = spr_bought;
}