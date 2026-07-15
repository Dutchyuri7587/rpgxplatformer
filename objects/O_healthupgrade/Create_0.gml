hasbeenbought = false;
cost = 1;
mousepressed = false;
timesbeenbought = 0;
maxtimesbeenbought = 4;

spr_unbought = S_button_shop_addplathealth;
spr_bought = S_button_shop_addplathealth_bought;

if global.flagshop[2] = true
{
	sprite_index = spr_bought;
}