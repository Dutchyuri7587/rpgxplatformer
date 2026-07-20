function delete_deltaruneminigame()
{
	instance_destroy(O_timer_deltarune);
	instance_destroy(O_Inside_deltarune);
	instance_destroy(O_bar_deltarune);
}

function delete_spamminigame()
{
	instance_destroy(O_spammer_spam);
	instance_destroy(O_zone_spam);
	instance_destroy(O_timer_spam);
}