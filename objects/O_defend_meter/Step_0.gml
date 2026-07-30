getminigamecontrols();

if !hitkeyhold
{
	hold_frames--;
	total_hold_frames--;
} 

if hitkeyhold
{
	hold_frames++;
	total_hold_frames++;
}

if hold_frames >= hold_duration_per_stage
{
	hold_frames = 0;
	currentstage++;
}

if hold_frames < revert_frames && !hitkeyhold
{
	currentstage--;
}



if hold_frames <= -15
{
	hold_frames = -15;
}

if !hitkeyhold && sprite_index = spr_stage6
{
	
}