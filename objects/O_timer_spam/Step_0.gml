timer--;

if timer <= 0
{
	timerdone = true;
	global.minigame_multiplier = 1.0
	
	
	instance_create_depth
	(
	O_zone_spam.x+25,
	O_zone_spam.y-50,
	depth-300,
	O_floatingtext,
	{font: testfont, col: c_white, text: string(global.minigame_multiplier)+"X"}
	);
	
	instance_create_depth
	(
	O_zone_spam.x-25,
	O_zone_spam.y-50,
	depth-300,
	O_floatingtext,
	{font: testfont, col: c_white, text:"Dude...."}
	);
	
	O_battle_manager.completedminigame = true;
	delete_spamminigame();
	exit;
}