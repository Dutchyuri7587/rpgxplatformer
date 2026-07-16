hasbeenbought = false;
cost = 1;
mousepressed = false;
timesbeenbought = 0;
maxtimesbeenbought = 1;

spr_unbought = S_shopsale;
spr_bought = S_shopsale_bought;

if global.flagshop[7] = true
{
	sprite_index = spr_bought;
}