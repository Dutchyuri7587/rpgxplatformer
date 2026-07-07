if place_meeting(x,y,O_wall)
{
	xspeed *= -1;
	movedirection *= -1;
}



if hasbeenhit = true
{
	enemyinvincibilitytime--;
	if enemyinvincibilitytime <= 0
	{
		hasbeenhit = false;
	}
}

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

	var _floorissolid = false;
	if instance_exists(myfloorplat)
	&& (myfloorplat.object_index == O_wall || object_is_ancestor(myfloorplat.object_index, O_wall))
	{
		_floorissolid = true;
	}

x += xspeed;

	//floor y collision
	
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
	
if !place_meeting(x-9,y+2,O_wall) || !place_meeting(x+9,y+2,O_wall)
{
	xspeed *= -1;
	movedirection *= -1;
}