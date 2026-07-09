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

//movement
xspeed = 0.75;
yspeed = 1;
velocity = 0.275;
movedirection = 1;
velocity = 2.5
falling = false

//moving platforms
myfloorplat = noone;
earlymovemoveplatxspeed = false;
downslopesemisolid = noone;
forgetsemisolid = noone;
moveplatxspeed = 0;
moveplatmaxyspd = velocity;

//death
maxhits = 3;
hits = 0;
hasbeenhit = false;

//kill the player ya dingus
damage = 1;

enemyinvincibilitytime = 0;
enemyinvincibilityframes = 10;

moneyworth = 5;
hasgivenmoney = false;