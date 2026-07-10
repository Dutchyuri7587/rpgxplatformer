hasbeenbought = false;
cost = 15;
mousepressed = false;
timesbeenbought = 0;
maxtimesbeenbought = 4;

spr_unbought = S_rpgshophealth;
spr_bought = S_rpgshophealth_bought;

if global.flagrpg[1] = true
{
	sprite_index = spr_bought;
}