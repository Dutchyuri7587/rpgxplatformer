function deltarune_minigame()
{
	O_battle_manager.spawnedminigame = true;
	instance_create_depth(64, 64, -200, O_bar_deltarune);
	instance_create_depth(64, 64, -205, O_Inside_deltarune);
	instance_create_depth(128, 64, -210, O_timer_deltarune);
}

function empty_minigame()
{
	spawnedminigame = true;
	completedminigame = true;
}