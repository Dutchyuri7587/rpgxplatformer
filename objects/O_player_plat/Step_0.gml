//get el inputs
getControls();


//get out of solid moveplatforms that have put themselves into the player in the begin step
#region
	var _rightwall = noone;
	var _leftwall = noone;
	var _bottomwall = noone;
	var _topwall = noone;
	var _list = ds_list_create();
	var _listsize = instance_place_list(x,y,O_moveplatform, _list, false);

	//loop through all colliding move platforms
	for (var i = 0; i < _listsize; i++)
	{
		var _listinst = _list[| i];
		
		//ifind closest walls in each direction
			//right walls
			if _listinst.bbox_left - _listinst.xspeed >= bbox_right-1
			{
				if !instance_exists(_rightwall) || _listinst.bbox_left < _rightwall.bbox_left
				{
					_rightwall = _listinst;
				}
			}
			//left wall
			if _listinst.bbox_right - _listinst.xspeed <= bbox_left+1
			{
				if !instance_exists(_leftwall) || _listinst.bbox_right > _rightwall.bbox_right
				{
					_leftwall = _listinst;
				}
			}
			//bottom wall
			if _listinst.bbox_top - _listinst.yspeed >= bbox_bottom-1
			{
				if !_bottomwall || _listinst.bbox_top < _bottomwall.bbox_top
				{
					_bottomwall = _listinst;
				}
			}
			//top wall
			if _listinst.bbox_bottom - _listinst.yspeed <= bbox_top+1
			{
				if !_topwall || _listinst.bbox_bottom > _topwall.bbox_bottom
				{
					_topwall = _listinst;
				}
			}
	}
	
	ds_list_destroy(_list);
	
	//get out of walls
		//right wall
		if instance_exists(_rightwall)
		{
			var _rightdist = bbox_right - x;
			x = _rightwall.bbox_left - _rightdist;
		}
		//left wall
		if instance_exists(_leftwall)
		{
			var _leftdist = x - bbox_left;
			x = _leftwall.bbox_right + _leftdist;
		}
		//bottom wall
		if instance_exists(_bottomwall)
		{
			var _bottomdist = bbox_bottom - y;
			y = _bottomwall.bbox_top - _bottomdist
		}
		//top wall (includes collision for crouch and polish
		if instance_exists(_topwall)
		{
			var _updist = y - bbox_top;
			var _targetY = _topwall.bbox_bottom + _updist;
			//check if there isnt a wall in the way
			if !place_meeting(x, _targetY, O_wall)
			{
				y = _targetY;
			}
		}
#endregion
//dont get left behind by my moveplat
earlymovemoveplatxspeed = false;
if instance_exists(myfloorplat) && myfloorplat.xspeed != 0 && !place_meeting(x,y+moveplatmaxyspd+1, myfloorplat)
{
	//go ahead and move yourslef back to the platform if you can
	if !place_meeting(x + myfloorplat.xspeed, y , O_wall)
	{
		x += myfloorplat.xspeed;
		earlymovemoveplatxspeed = true;
	}
}

//crouching
	//get into crouch

		//player manual
		if downkey && onground
		{
			crouching = true;
		}
		//forced
		if onground && place_meeting(x,y,O_wall)
		{
			crouching = true;
		}
		//change collision mask
		if crouching {mask_index = sprcrouch;};
		
	//gget out of crouching
		//manually
		if !downkey && crouching
		{
			mask_index = spridle;
			if !place_meeting(x,y,O_wall)
			{
				crouching = false
			}
			else
			{
				mask_index = sprcrouch;
			}
		}
		//forched uncrouch in air
		if !onground
		{
			mask_index = spridle;
			if !place_meeting(x,y,O_wall)
			{
				crouching = false
			}
			else
			{
				mask_index = sprcrouch;
			}
		}

//x movement
	//get the direction
	movedirection = rightkey - leftkey;

	
	//get face
	if movedirection != 0 {face = movedirection;};


	//get xspeed
	runtype = runkey;
	xspeed = movedirection * movespeed[runtype];
	
	if crouching {xspeed = 0;};

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
	downslopesemisolid = noone;
	if yspeed >= 0 && !place_meeting(x + xspeed, y + 1, O_wall) && place_meeting(x + xspeed, y + abs(xspeed)+1, O_wall)
	{
		//check for semisolid in the way
		downslopesemisolid = checkforsemisolidplatform(x + xspeed, y + abs(xspeed)+1);
		//precisely move down slope if there isnt a semisolid
		if !instance_exists(downslopesemisolid)
		{
			while !place_meeting(x + xspeed, y + _subpixel, O_wall) {y += _subpixel; };
		}	
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
	var _floorissolid = false;
	if instance_exists(myfloorplat)
	&& (myfloorplat.object_index == O_wall || object_is_ancestor(myfloorplat.object_index, O_wall))
	{
		_floorissolid = true;
	}
	
	if jumpkeybuffered && jumpcount < maxamountjumps && (!downkey || _floorissolid)
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
	
	//floor y collision
	
	//reset the floorplat to be able to jump
	if jumpkeypressed {myfloorplat = noone;};
	//check for solid and semisolid platforms under me
	var _clampYspd = max(0, yspeed);
	var _list = ds_list_create(); // create a ds list to store all of the objects we run into
	var _array = array_create(0);
	array_push(_array, O_wall, O_semisolidwall);
	
	
	//do the actual check and add objects to the list
	var _listsize = instance_place_list(x, y+1 + _clampYspd + moveplatmaxyspd, _array, _list, false);
	
		var _ycheck = y+1 + _clampYspd;
		if instance_exists(myfloorplat) {_ycheck += max(0, myfloorplat.yspeed); };
		var _semisolid = checkforsemisolidplatform(x, _ycheck);
	
	//loop through the colliding instances and only return one if it' s top is below the player
	for( var i = 0; i < _listsize; i++)
	{
		//get an instance of O_wall or O_semisolidwall from the list
		var _listinst = _list[| i];
		
		//avoid magentism
		if (_listinst != forgetsemisolid
		&& (_listinst.yspeed <= yspeed || instance_exists(myfloorplat))
		&& ( _listinst.yspeed > 0 || place_meeting( x, y+1 + _clampYspd, _listinst ) )) // vergeet niet om wanneer je forgetsemisolid toevoegd om een () toe te veogen (kijk 1:44:41 for refrence)
		|| (_listinst == _semisolid)
		{
			//return a solid wall or any semisolid walls that are below the player
			if _listinst.object_index == O_wall
			|| object_is_ancestor(_listinst.object_index, O_wall)
			|| floor(bbox_bottom) <= ceil(_listinst.bbox_top - _listinst.yspeed)
			{
				//return the "highest" wall object
				if !instance_exists(myfloorplat)
				|| _listinst.bbox_top + _listinst.yspeed <= myfloorplat.bbox_top + myfloorplat.yspeed
				|| _listinst.bbox_top + _listinst.yspeed <= bbox_bottom
				{
					myfloorplat = _listinst;
				}
			}
		}
	}
	//destroy the ds list
	ds_list_destroy(_list);
	
	//downslope semisolid for making sure we dont miss semisolids going down slopes
	if instance_exists(downslopesemisolid) {myfloorplat = downslopesemisolid;};
	
	//one last check to make sure the floor is actually below us
	if instance_exists(myfloorplat) && !place_meeting(x, y + moveplatmaxyspd, myfloorplat)
	{
		myfloorplat = noone;
	}
	
	//land on the ground platform if there is one
	if instance_exists(myfloorplat)
	{
		//scoot up to our wall precisely
		var _subpixel = .5
		while !place_meeting(x, y + _subpixel, myfloorplat) && !place_meeting(x,y,O_wall) {y += _subpixel;};
		//make sure we dont end up below a semisolid
		if myfloorplat.object_index == O_semisolidwall || object_is_ancestor(myfloorplat.object_index, O_semisolidwall)
		{
			while place_meeting(x, y, myfloorplat) {y -= _subpixel; };
		}
		//floor the y variable
		y = floor(y);
		
		//collide with ground
		yspeed = 0;
		setonground(true);
	}

	//manually fall thourgh semislid
	if downkey && jumpkeypressed
	{
		//make sure we have a floor platform thats semisolid
		if instance_exists(myfloorplat)
		&& (myfloorplat.object_index == O_semisolidwall || object_is_ancestor(myfloorplat.object_index, O_semisolidwall))
		{
			//check if we can go below the semi
			var _ycheck = max(1, myfloorplat.yspeed+1);
			if !place_meeting(x, y + _ycheck, O_wall)
			{
				//move below the platform
				y += 1+ _ycheck;
				
				//inherint any downward speed from my floor platform so it doesnt catch on me
				yspeed = _ycheck-1;
				
				//forget this platform for a brief time so we dont get caught again
				forgetsemisolid = myfloorplat;
				
				//no more floor platform
				setonground(false);
			}
		}
	}

	//moving
	if !place_meeting(x,y+yspeed,O_wall) {y += yspeed;};
	
	//reset forgetsemisolid var
	if instance_exists(forgetsemisolid) && !place_meeting(x, y, forgetsemisolid)
	{
		forgetsemisolid = noone;
	}
	
//final moving platform collisions and movement
	//x - moveplatxspeed and collision
	//get the moveplatxspeed
	moveplatxspeed = 0;
	if instance_exists(myfloorplat) {moveplatxspeed = myfloorplat.xspeed;};
	
	//move with moveplatxspeed
	if !earlymovemoveplatxspeed
	{
		if place_meeting(x + moveplatxspeed, y, O_wall)
		{
			var _subpixel = .5;
			var _pixelcheck = _subpixel * sign(moveplatxspeed);
			while !place_meeting(x + _pixelcheck, y, O_wall)
			{
				x += _pixelcheck;
			}
			//set moveplatxspd to 0 to finish collision
			moveplatxspeed = 0;
		}
	
		//actually move
		x += moveplatxspeed;
	}
	//y - snap myse4lf to myfloorplat if its moving vertically
	if instance_exists(myfloorplat) 
	&& (myfloorplat.yspeed != 0
	|| myfloorplat.object_index == O_moveplatform
	|| object_is_ancestor(myfloorplat.object_index, O_moveplatform)
	|| myfloorplat.object_index == O_semisolidmoveplat
	|| object_is_ancestor(myfloorplat.object_index, O_semisolidmoveplat))
	{
		//snap to the top of the floor platform (make the y not floored)
		if !place_meeting(x, myfloorplat.bbox_top, O_wall)
		&& myfloorplat.bbox_top >= bbox_bottom-moveplatmaxyspd
		{
			y = myfloorplat.bbox_top;
		}
		
		//made redundant
									//going up into a solid wall while on a semisolid
									/*if myfloorplat.yspeed < 0 && place_meeting(x, y + myfloorplat.yspeed, O_wall)
									{
										//get pushed down through the semisolid
										if myfloorplat.object_index == O_semisolidwall || object_is_ancestor(myfloorplat.object_index, O_semisolidwall)
										{
											//get pushed down trhough the semisolid
											var _subpixel = .25;
											while place_meeting(x, y + myfloorplat.yspeed, O_wall) {y += _subpixel;};
											//if we got pushed into a solid wall while going downwards push ourselfse out
											while place_meeting(x, y, O_wall) {y -= _subpixel;};
											y = round(y);
										}
										//cancel the myfloorplat variable
										setonground(false);
									}*/
	}
	
	//push myself through semisolid if being crushed
	if instance_exists(myfloorplat)
	&& (myfloorplat.object_index == O_semisolidwall || object_is_ancestor(myfloorplat.object_index, O_semisolidwall))
	&& place_meeting(x,y,O_wall)
	{
		//if im already stuck in a wall atp, try and move me down to get below a semi
		//if im still stuck, it means im actually being curshed
		
		//dont check too far, we dont wanna teleport below walls
		var _maxpushdist = 10;
		var _pusheddist = 0;
		var _startY = y;
		while place_meeting(x,y,O_wall) && _pusheddist <= _maxpushdist
		{
			y++;
			_pusheddist++;
		}
		
		myfloorplat = false;
		
		//return myself to start y cause ive been crushed
		if _pusheddist > _maxpushdist {y = _startY};
	}
	
//check if im crushed
image_blend = c_white
if place_meeting(x,y,O_wall)
{
	image_blend = c_blue
}

if gothitplayer = true
{
	invincibilitytime--;
	
	if invincibilitytime <= 0
	{
		gothitplayer = false;
	}
}
	
//sprite controi
	//walk
	if abs(xspeed) > 0 {sprite_index = sprwalk};
	//running
	if abs(xspeed) >= movespeed[1] {sprite_index = sprrun;};
	//idle
	if xspeed == 0 {sprite_index = spridle};
	//jump
	if !onground {sprite_index = sprjump};
	//crouch
	if crouching {sprite_index = sprcrouch;};
	//collision mask
	mask_index = spridle;
	if crouching {mask_index = sprcrouch;};