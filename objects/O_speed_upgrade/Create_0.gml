hasbeenbought = false;
cost = 1;
mousepressed = false;
timesbeenbought = 0;
maxtimesbeenbought = 1;

spr_unbought = S_shop_speed;
spr_bought = S_shop_speed_bought;

if global.flagshop[6] = true
{
	sprite_index = spr_bought;
}