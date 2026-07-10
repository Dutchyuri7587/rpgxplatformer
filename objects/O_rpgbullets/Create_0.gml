hasbeenbought = false;
cost = 10;
mousepressed = false;
timesbeenbought = 0;
maxtimesbeenbought = 1;

spr_unbought = S_bulletrefill;
spr_bought = S_bulletrefill_bought;

if global.flagrpg[3] = true
{
	sprite_index = spr_bought;
}