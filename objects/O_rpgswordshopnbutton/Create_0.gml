hasbeenbought = false;
cost = 40;
mousepressed = false;
timesbeenbought = 0;
maxtimesbeenbought = 1;

spr_unbought = S_rpgshophealth;
spr_bought = S_rpgshophealth_bought;

if global.flagrpg[2] = true
{
	sprite_index = spr_bought;
}