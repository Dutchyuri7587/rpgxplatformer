//get el inputs
getControls();
//x movement
	//get the direction
	movedirection = rightkey - leftkey;
	
	//get face
	if movedirection != 0 {face = movedirection;};

	//get xspeed
	runtype = runkey;
	xspeed = movedirection * movespeed[runtype];

	//x collisions wooooo!!!!!!
	var _subpixel =.5;
	if place_meeting(x + xspeed, y, O_wall)
	{
		//First check if there is a slope to go up 
		if !place_meeting(x + xspeed, y - abs(xspeed)-1, O_wall)
		{
			while place_meeting(x + xspeed, y, O_wall) { y -= _subpixel; };
		} 
		//next, check for slopes, otherwise do a normal collision
		else
		{
			//ceiling slopes
			if !place_meeting(x + xspeed, y + abs(xspeed*2)+1, O_wall)
			{
				while place_meeting(x + xspeed, y, O_wall) {y += _subpixel; };
			}else
			{
			
			//scoot up to wall
			var _pixelcheck = _subpixel * sign(xspeed);
			while !place_meeting(x + _pixelcheck, y, O_wall) {x += _pixelcheck;};
			
			//set xspeed to collide with stuff
			xspeed = 0;
			}
		}
	}

	//stuff to go down slopes
	if yspeed >= 0 && !place_meeting(x + xspeed, y + 1, O_wall) && place_meeting(x + xspeed, y + abs(xspeed)+1, O_wall)
	{
		while !place_meeting(x + xspeed, y + _subpixel, O_wall) {y += _subpixel; };
	}

	//moving
	x += xspeed;

//y movement!

	//gravity
	
	if coyotehangtimer > 0
	{
		//count the timer down
		coyotehangtimer--;
	} else {
		//apply gravity
		yspeed += grvty;
		//no longer on ground
		setonground(false);
	}

	if onground
	{
		jumpcount = 0;
		coyotejumptimer = coyotejumpframes;
	} 
		//make it so you cant do the jump in midair
	else {
		coyotejumptimer--;
		if jumpcount == 0 && coyotejumptimer <= 0 {jumpcount = 1;};
	}
	
	//jump jump into the air! || initiate the jump
	if jumpkeybuffered && jumpcount < maxamountjumps
	{
		//reset your buffer to not double jump
		jumpkeybeingbuffered = false;
		jumpkeybuffertimer = 0;
		//increase the jump
		jumpcount++;
		
		holdingjumptimer = jumpholdframes;
	}
	//cut off the jump when releasing the key
	if !jumpkey
	{
		holdingjumptimer = 0;
	}
		// jump based on timer/holding jump button
		if holdingjumptimer > 0
		{
			// rerpeatedly set the yspeed to your jumping speed
			yspeed = jumpspeed;
			
			// count down the timer
			holdingjumptimer--;
		}

// y collision and movement
	
	//cap falling speed
	if yspeed > terminalvlcity {yspeed = terminalvlcity;};
	
	//y collision
	var _subpixel = .5
	
	//upwards y collision [with ceiling slopes]
	if yspeed < 0 && place_meeting(x, y + yspeed, O_wall)
	{
		//jump into sloped ceilings
		var _slopeslide = false;
		//slide upleft slope
		if movedirection == 0 && !place_meeting(x - abs(yspeed)-1, y + yspeed, O_wall)
		{
			while place_meeting(x, y + yspeed, O_wall) {x -= 1;};
			_slopeslide = true;
		}
		
		//slide upright slope
		if movedirection == 0 && !place_meeting(x + abs(yspeed)+1, y + yspeed, O_wall)
		{
			while place_meeting(x, y + yspeed, O_wall) {x += 1;};
			_slopeslide = true;
		}
		
		//normal y collision
		if !_slopeslide
		{
			//scoot to wall
			var _pixelcheck = _subpixel * sign(yspeed);
			while !place_meeting(x, y+ _pixelcheck, O_wall)
			{
			y += _pixelcheck;
			}
			
			//bonk
			//if yspeed < 0
			//{holdingjumptimer = 0;};
		
			//set y speed to 0 to collide
			yspeed = 0;
		}
	}
	
	//downwards y collision
	if place_meeting(x, y + yspeed, O_wall)
	{
		//scoot to wall
		var _pixelcheck = _subpixel * sign(yspeed);
		if yspeed >= 0
		{
			while !place_meeting(x, y+ _pixelcheck, O_wall)
			{
				y += _pixelcheck;
			}

			//set y speed to 0 to collide
			yspeed = 0;
		}

		if  place_meeting(x, y+1, O_wall)
		{
			setonground(true);
		}
	}

	//moving
	y += yspeed;
	
//sprite controi
	//walk
	if abs(xspeed) > 0 {sprite_index = sprwalk};
	//running
	if abs(xspeed) >= movespeed[1] {sprite_index = sprrun;};
	//idle
	if xspeed == 0 {sprite_index = spridle};
	//jump
	if !onground {sprite_index = sprjump};
	//collision mask
	mask_index = spridle;