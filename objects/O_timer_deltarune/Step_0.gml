getminigamecontrols();

x -= xspeed;

if x <= O_bar_deltarune.bbox_left-16
{
	delete_minigame();
	exit;
}

if hitkey = 1
{
	if place_meeting(x,y,O_Inside_deltarune)
	{
		//put rewards here
		global.deltarune_multiplier = 1.5;
		
		
		instance_create_depth
		(
		x-20,
		y,
		depth-300,
		O_floatingtext,
		{font: testfont, col: c_white, text:"Nice!"}
		);
		
		instance_create_depth
		(
		x+20,
		y,
		depth-300,
		O_floatingtext,
		{font: testfont, col: c_white, text: string(global.deltarune_multiplier)+"X"}
		);
		
		
		delete_minigame();
		exit;
	}
	else if place_meeting(x,y,O_bar_deltarune)
	{
		//put rewards
		
		global.deltarune_multiplier = 1.2;
		
		
		instance_create_depth
		(
		x-25,
		y,
		depth-300,
		O_floatingtext,
		{font: testfont, col: c_white, text:"Almost..."}
		);
		
		instance_create_depth
		(
		x+25,
		y,
		depth-300,
		O_floatingtext,
		{font: testfont, col: c_white, text: string(global.deltarune_multiplier) + "X"}
		);
		delete_minigame();
		exit;
	}
	else
	{
		//put rewards
		
		global.deltarune_multiplier = 1.0;
		
		
		instance_create_depth
		(
		x-25,
		y,
		depth-300,
		O_floatingtext,
		{font: testfont, col: c_white, text:"Dude....."}
		);
		
		instance_create_depth
		(
		x+25,
		y,
		depth-300,
		O_floatingtext,
		{font: testfont, col: c_white, text: string(global.deltarune_multiplier)+"X"}
		);
		delete_minigame();
		exit;
	}
}