hasbeenbought = false;
cost = 25;
mousepressed = false;
timesbeenbought = 0;
maxtimesbeenbought = 1;

spr_unbought = S_jumpupgrade;
spr_bought = S_jumpupgrade_bought;

if global.flagplat[2] = true
{
	sprite_index = spr_bought;
}