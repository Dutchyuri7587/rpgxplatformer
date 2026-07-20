function deltarune_minigame()
{
	O_battle_manager.spawnedminigame = true;
	instance_create_depth(64, 64, -200, O_bar_deltarune);
	instance_create_depth(64, 64, -205, O_Inside_deltarune);
	instance_create_depth(128, 64, -210, O_timer_deltarune);
}

function spam_minigame()
{
	O_battle_manager.spawnedminigame = true;
	instance_create_depth(128, 160, -175, O_zone_spam);
	
	instance_create_depth(128, 72, -200, O_timer_spam);
	instance_create_depth(128, 150, -205, O_spammer_spam);
	O_timer_spam.timer = O_timer_spam.timerframes;
}

function empty_minigame()
{
	spawnedminigame = true;
	completedminigame = true;
}

function deltarune_minigame()
{
	instance_create_depth(64, 64, -200, O_bar_deltarune);
	instance_create_depth(64, 64, -205, O_Inside_deltarune);
	instance_create_depth(128, 64, -210, O_timer_deltarune);
}