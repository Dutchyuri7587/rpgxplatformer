getminigamecontrols();

if hitkey
{
	presses += presspower;
	presses = clamp(presses,0,neededpresses)
	sprite_index = spr_powered
}
else
{
	sprite_index = spr_unpowered;
}

if presses >= neededpresses
{
	O_battle_manager.completedminigame = true;
	global.minigame_multiplier = 1.5;
	
	instance_create_depth
	(
	O_zone_spam.x+25-50,
	O_zone_spam.y-100,
	depth-300,
	O_floatingtext,
	{font: testfont, col: c_white, text: string(global.minigame_multiplier)+"X"}
	);
	
	instance_create_depth
	(
	O_zone_spam.x-25-50,
	O_zone_spam.y-100,
	depth-300,
	O_floatingtext,
	{font: testfont, col: c_white, text:"Nice!"}
	);
	
	delete_spamminigame();
	exit;
}
