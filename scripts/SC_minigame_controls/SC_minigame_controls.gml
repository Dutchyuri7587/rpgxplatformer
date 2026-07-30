function getminigamecontrols()
{		
	hitkey = keyboard_check_pressed(ord("C")) + keyboard_check_pressed(ord("J"));
		hitkey = clamp(hitkey,0,1);
		
	hitkeyhold = keyboard_check(ord("C")) + keyboard_check(ord("J"));
		hitkeyhold = clamp(hitkeyhold,0,1);
}