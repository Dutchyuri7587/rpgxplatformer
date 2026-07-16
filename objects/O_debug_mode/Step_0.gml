if keyboard_check_pressed(ord("1"))
{
	room_goto(hubworld);
}

if keyboard_check_pressed(ord("M"))
{
	global.money += 9999;
}

if keyboard_check_pressed(ord("N")) // essentially godmode
{
	global.plathp += 9999;
	global.party[0].hp += 9999;
	global.party[0].maxhp += 9999;
	global.party[0].strength += 9999;
}

if keyboard_check_pressed(ord("Y")) // make you always go first
{
	global.party[0].speedupgrade = true;
}

if keyboard_check_pressed(ord("2"))
{
	room_goto(R_platformer2);
}

if keyboard_check_pressed(ord("3"))
{
	room_goto(R_platformer3);
}