//custom functions for the player
function setonground(_val = true)
{
	if _val == true
	{
		onground = true;
		coyotehangtimer = coyotehangframes;
	} else {
		onground = false;
		myfloorplat = noone;
		coyotehangtimer = 0;
	}
}

function checkforsemisolidplatform(_x, _y)
{
	//create a return variable
	var _return = noone;
	//if not moving upwards then check for collision
	if yspeed >= 0 && place_meeting(_x, _y, O_semisolidwall)
	{
		var _list = ds_list_create();
		var _listsize = instance_place_list(_x, _y, O_semisolidwall, _list, false);
		
		for (var i = 0; i < _listsize; i++)
		{
			var _listinst = _list[| i]
			if _listinst != forgetsemisolid && floor(bbox_bottom) <= ceil(_listinst.bbox_top - _listinst.yspeed)
			{
				_return = _listinst;
				//exit thge loop early
				i = _listsize;
			}
		}
		ds_list_destroy(_list);
	}
	//return our variable
	return _return;
}

depth = -30;

//controlling setup
controlsSetup();

//sprite
spridle = S_playerplatidle;
sprrun = S_playerplatrun;
sprjump = S_playerplatjump;
sprwalk = S_playerplatwalk;
sprcrouch = S_playerplatcrouch;

//moving
face = 1;
movedirection = 0;
runtype = 0;
movespeed[0] = 2.5;
movespeed[1] = 3.5;
xspeed = 0;
yspeed = 0;

//state vars
crouching = false;

//jumping
	grvty = .275;
	terminalvlcity = 6.5;

	maxamountjumps = 2;
	jumpcount = 0;
	holdingjumptimer = 0;
	jumpholdframes = 12; //frames to be able to hold the jump
	jumpspeed = -3;

	onground = true;

	//coyotetime
	//hang time
	coyotehangframes = 4;
	coyotehangtimer = 0;
	//jumpbuffertime
	coyotejumpframes = 5;
	coyotejumptimer = 0;

//moving platforms
myfloorplat = noone;
earlymovemoveplatxspeed = false;
downslopesemisolid = noone;
forgetsemisolid = noone;
moveplatxspeed = 0;
moveplatmaxyspd = terminalvlcity;

//enemy things
haskilledenemy = false
enemyjumpkilltimer = 0;
enemyjumpkillframes = 12;
enemykilljumpspeed = -5;

//health
hp = 5;
maxhp = 5;
