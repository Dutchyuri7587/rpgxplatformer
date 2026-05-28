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

//controlling setup
controlsSetup();

//sprite
spridle = S_playerplatidle
sprrun = S_playerplatrun
sprjump = S_playerplatjump
sprwalk = S_playerplatwalk

//moving
face = 1;
movedirection = 0;
runtype = 0;
movespeed[0] = 2.5;
movespeed[1] = 3.5;
xspeed = 0;
yspeed = 0;

//jumping
grvty = .275;
terminalvlcity = 6.5;

maxamountjumps = 100;
jumpcount = 0;
holdingjumptimer = 0;
jumpholdframes = 12; //frames to be able to hold the jump
jumpspeed = -3;

onground = true;

//coyotetime

coyotehangframes = 4;
coyotehangtimer = 0;

coyotejumpframes = 5;
coyotejumptimer = 0;

//moving platforms
myfloorplat = noone;
moveplatxspeed = 0;
