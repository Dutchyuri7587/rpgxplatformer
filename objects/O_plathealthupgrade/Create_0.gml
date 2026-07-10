hasbeenbought = false;
cost = 15;
mousepressed = false;
timesbeenbought = 0;
maxtimesbeenbought = 3;

spr_unbought = S_button_shop_addplathealth;
spr_bought = S_button_shop_addplathealth_bought;

if global.flagplat[1] = true
{
	sprite_index = spr_bought;
}