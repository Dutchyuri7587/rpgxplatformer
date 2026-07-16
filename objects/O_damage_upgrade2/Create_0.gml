hasbeenbought = false;
cost = 1;
mousepressed = false;
timesbeenbought = 0;
maxtimesbeenbought = 1;

spr_unbought = S_shop_damage_2;
spr_bought = S_shop_damage_2_bought;

if global.flagshop[4] = true
{
	sprite_index = spr_bought;
}