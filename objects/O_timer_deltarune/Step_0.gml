getminigamecontrols();

x -= xspeed;

if x <= O_bar_deltarune.bbox_left-16
{
	O_battle_manager.completedminigame = true;
	
		instance_create_depth
		(
		O_Inside_deltarune.x-25,
		O_Inside_deltarune.y,
		depth-300,
		O_floatingtext,
		{font: testfont, col: c_white, text:"Dude....."}
		);
		
		instance_create_depth
		(
		O_Inside_deltarune.x+25,
		O_Inside_deltarune.y,
		depth-300,
		O_floatingtext,
		{font: testfont, col: c_white, text: string(global.minigame_multiplier)+"X"}
		);
	
	delete_deltaruneminigame();
	exit;
}

if hitkey = 1
{
	if place_meeting(x,y,O_Inside_deltarune)
	{
		//put rewards here
		global.minigame_multiplier = 1.5;
		
		
		instance_create_depth
		(
		O_Inside_deltarune.x-20,
		O_Inside_deltarune.y,
		depth-300,
		O_floatingtext,
		{font: testfont, col: c_white, text:"Nice!"}
		);
		
		instance_create_depth
		(
		O_Inside_deltarune.x+20,
		O_Inside_deltarune.y,
		depth-300,
		O_floatingtext,
		{font: testfont, col: c_white, text: string(global.minigame_multiplier)+"X"}
		);
		
		O_battle_manager.completedminigame = true;
		
		delete_deltaruneminigame();
		exit;
	}
	else if place_meeting(x,y,O_bar_deltarune)
	{
		//put rewards
		
		global.minigame_multiplier = 1.2;
		
		
		instance_create_depth
		(
		O_Inside_deltarune.x-25,
		O_Inside_deltarune.y,
		depth-300,
		O_floatingtext,
		{font: testfont, col: c_white, text:"Almost..."}
		);
		
		instance_create_depth
		(
		O_Inside_deltarune.x+25,
		O_Inside_deltarune.y,
		depth-300,
		O_floatingtext,
		{font: testfont, col: c_white, text: string(global.minigame_multiplier) + "X"}
		);
		
		O_battle_manager.completedminigame = true;
		
		delete_deltaruneminigame();
		exit;
	}
	else
	{
		//put rewards
		
		global.minigame_multiplier = 1.0;
		
		
		instance_create_depth
		(
		O_Inside_deltarune.x-25,
		O_Inside_deltarune.y,
		depth-300,
		O_floatingtext,
		{font: testfont, col: c_white, text:"Dude....."}
		);
		
		instance_create_depth
		(
		O_Inside_deltarune.x+25,
		O_Inside_deltarune.y,
		depth-300,
		O_floatingtext,
		{font: testfont, col: c_white, text: string(global.minigame_multiplier)+"X"}
		);
		
		O_battle_manager.completedminigame = true;
		
		delete_deltaruneminigame();
		exit;
	}
}