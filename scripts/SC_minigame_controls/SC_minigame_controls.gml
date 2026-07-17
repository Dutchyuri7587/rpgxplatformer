function getminigamecontrols()
{		
	hitkey = keyboard_check_pressed(ord("C")) + keyboard_check_pressed(ord("J"));
		hitkey = clamp(hitkey,0,1);
}