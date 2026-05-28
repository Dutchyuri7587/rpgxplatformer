instance_deactivate_all(true);

units = [];
turn = 0;
turnorder = [];
renderorder = [];

turncount = 0;
roundcount = 0;
battlewaitframes = 30;
battlewaittimeremaining = 0;
currentuser = noone;
currentaction = -1;
currenttargets = noone;
acting = false;

//make enemies
for (var i = 0; i < array_length(enemies); i++)
{
    enemyunits[i] = instance_create_depth(
        x+250+(i*10),
        y+20+(i*20)+(i*random(floor(50)-5)),
        depth-10,
        O_battleunittestenemy,
        enemies[i]
    );

    array_push(units, enemyunits[i]);
}

//make party
for (var i = 0; i < array_length(global.party); i++)
{
    partyunits[i] = instance_create_depth(
        x+70+(i*10),
        y+68+(i*15),
        depth-10,
        O_battleunitplayer,
        global.party[i]
    );

    array_push(units, partyunits[i]);
}

//shuffle turn order
turnorder = array_shuffle(units);

//get renderoder
refreshrenderorder = function()
{
	renderorder = [];
	array_copy(renderorder, 0, units, 0, array_length(units));
	array_sort(renderorder, function(_1, _2)
	{
		return _1.y - _2.y;
	});
}
refreshrenderorder();

//state machine
function battlestateselectaction()
{
	//get current unit
	var _unit = turnorder[turn];
	
	//are they dead or cant act?
	if !(instance_exists(_unit)) || (_unit.hp <= 0)
	{
		battlestate = battlestatevictorycheck;
		exit;
	}
	
	//select an action to perform
	beginaction(_unit.id, global.actionlibrarby.attack, _unit.id);
}

function beginaction(_user, _action, _targets)
{
	currentuser = _user;
	currentaction = _action;
	currenttargets = _targets;
	if (!is_array(currenttargets)) currenttargets = [currenttargets];
	battlewaittimeremaining = battlewaitframes;
	with (_user)
	{
		acting = true;
		//play user anim if it is defined for that user & action
		if (!is_undefined(_action[$ "useranimation"])) && (!is_undefined(_user.sprites[$ _action.useranimation]))
		{
			sprite_index = sprites[$ _action.useranimation];
			image_index = 0;
		}
	}
	battlestate = battlestateperformaction;
}

function battlestateperformaction()
{
	//if animation etc is still playing
	if (currentuser.acting)
	{
		//when it ends, perform action effect if it exiusts
		if (currentuser.image_index >= currentuser.image_number -1)
		{
			with (currentuser)
			{
				sprite_index = sprites.idle;
				image_index = 0;
				acting = false;
			}
			if (variable_struct_exists(currentaction, "effectsprite"))
			{
				if (currentaction.effectontarget == MODE.ALWAYS) || ((currentaction.effectontarget == MODE.VARIES) && (array_length(currenttargets) <=1))
				{
					for (var i = 0; i <array_length(currenttargets); i++)
					{
						instance_create_depth(currenttargets[i].x,currenttargets[i].y, currenttargets[i].depth-1,O_rpg_hitfx,{sprite_index: currentaction.effectsprite});
					}
				}
				else //play it at 0,0
				{
					var _effectsprite = currentaction._effectsprite
					if (variable_struct_exists(currentaction, "effectspritenotarget")) _effectsprite = currentaction.effectspritenotarget;
					instance_create_depth(x,y,depth-100,O_rpg_hitfx,{sprite_index: _effectsprite});
				}
			}
			currentaction.func(currentuser, currenttargets);
		}
	}
	else //wait for delay and then end turn
	{
		if (!instance_exists(O_rpg_hitfx))
		{
			battlewaittimeremaining--
			if (battlewaittimeremaining == 0)
			{
				battlestate = battlestatevictorycheck;
			}
		}
	}
}

function battlestatevictorycheck()
{
	battlestate = battlestateturnprogress
}

function battlestateturnprogress()
{
	turncount++;
	turn++;
	//loop turns
	if (turn > array_length(turnorder) - 1)
	{
		turn = 0;
		roundcount++;
	}
	battlestate = battlestateselectaction;
}

battlestate = battlestateselectaction;