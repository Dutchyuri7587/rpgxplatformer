hasbeenbought = false;
cost = 1;
mousepressed = false;
timesbeenbought = 0;
maxtimesbeenbought = 1;

spr_unbought = S_shop_stamina;
spr_bought = S_shop_stamina_bought;

if global.flagshop[5] = true
{
	sprite_index = spr_bought;
}