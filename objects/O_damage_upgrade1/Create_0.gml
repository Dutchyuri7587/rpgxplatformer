hasbeenbought = false;
cost = 1;
mousepressed = false;
timesbeenbought = 0;
maxtimesbeenbought = 1;

spr_unbought = S_rpgshopsword;
spr_bought = S_rpgshopsword_bought;

if global.flagshop[3] = true
{
	sprite_index = spr_bought;
}