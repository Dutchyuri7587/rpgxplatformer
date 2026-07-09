if keyboard_check_pressed(ord("1"))
{
	room_goto(hubworld);
}

if keyboard_check_pressed(ord("M"))
{
	global.money += 9999;
}

if keyboard_check_pressed(ord("2"))
{
	room_goto(R_platformer2);
}

if keyboard_check_pressed(ord("3"))
{
	room_goto(R_platformer3);
}