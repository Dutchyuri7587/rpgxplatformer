function controlsSetup()
{
	bufferframes = 3; //buffertime || aka how many frames of grace period you give the player for inputs
	jumpkeybeingbuffered = 0; //jumpkeybuffered
	jumpkeybuffertimer = 0; //jumpkeybuffertimer
}
	
function getControls()
{
	//get directions
	rightkey = keyboard_check(ord("D")) + keyboard_check(vk_right);
		rightkey = clamp(rightkey, 0, 1);
	leftkey = keyboard_check(ord("A")) + keyboard_check(vk_left);
		leftkey = clamp(leftkey, 0, 1);
	downkey = keyboard_check(ord("S")) + keyboard_check(vk_down);
		downkey = clamp(downkey, 0, 1);
	
	
	//action inputs
	jumpkeypressed = keyboard_check_pressed(vk_space) + keyboard_check_pressed(vk_up) + keyboard_check_pressed(ord("W"));
		jumpkeypressed = clamp(jumpkeypressed, 0, 1);
	//held ver of jumpkey
	jumpkey = keyboard_check(vk_space) + keyboard_check(vk_up) + keyboard_check(ord("W"))
		jumpkey = clamp(jumpkey, 0, 1);
	
	//running
	runkey = keyboard_check(vk_shift) + keyboard_check(ord("X"));
		runkey = clamp(runkey, 0, 1);
		
		
	#region magic
	normalmagickey = keyboard_check(ord("X")) + keyboard_check(ord("U"))
		normalmagickey = clamp(normalmagickey, 0, 1)
		
	aoemagickey = keyboard_check(ord("Z")) + keyboard_check(ord("I"))
		aoemagickey = clamp(aoemagickey, 0, 1)
		
	#endregion
	
	//le jump key buffering
	if jumpkeypressed
	{jumpkeybuffertimer = bufferframes;}
	if jumpkeybuffertimer > 0
	{
		jumpkeybuffered = 1;
		jumpkeybuffertimer--;
	} 
	else
	{
		jumpkeybuffered = 0;
	}	
}