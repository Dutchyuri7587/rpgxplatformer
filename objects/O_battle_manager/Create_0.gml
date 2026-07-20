instance_deactivate_all(true);
instance_activate_object(O_musicsetter);
instance_activate_object(O_camera);
instance_activate_object(O_general_drawer);
instance_activate_object(O_retry);
instance_activate_object(O_pauser);
instance_activate_object(O_debug_mode);

completedminigame = false;
spawnedminigame = false;

units = [];
turn = 0;
turnorder = [];
renderorder = [];

turncount = 0;
roundcount = 0;
battlewaitframes = 2;
battlewaittimeremaining = 0;
battletext = "";
currentuser = noone;
currentaction = -1;
currenttargets = noone;
acting = false;
roomtheme = 1; // sets the battle bg

//targeting cursor
cursor =
{
	activeuser: noone,
	activetarget: noone,
	activeaction: -1,
	targetside: -1,
	targetindex: 0,
	targetall: false,
	confirmdelay: 0,
	active: false
};

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

//make enemies
for (var i = 0; i < array_length(enemies); i++)
{
    enemyunits[i] = instance_create_depth(
        x+250+(i*10) + (irandom_range(0,5)),
        y+20*(i+1)+(i*7) + (irandom_range(2,5)),
        depth-10,
        O_battleunitenemy,
        enemies[i]
    );

    array_push(units, enemyunits[i]);
}



//shuffle turn order
if global.party[0].speedupgrade = true
{
	turnorder = units
}
else
{
	turnorder = array_shuffle(units);
}

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
	if (!instance_exists(O_menu))
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
	
		//if unit is player controlled:
		if (_unit.object_index == O_battleunitplayer)
		{
			//compile the action emnu
			var _menuoptions = [];
			var _submenus = {};
			
			var _actionlist = _unit.actions;
			
			for (var i = 0; i < array_length(_actionlist); i++)
			{
				var _action = _actionlist[i];
				var _available = true;
				var _nameandcount = _action.name;
				if (_action.submenu == -1)
				{
					array_push(_menuoptions, [_nameandcount, menuselectaction, [_unit, _action], _available]);
				}
				else
				{
					//create or add a submenu
					if (is_undefined(_submenus[$ _action.submenu]))
					{
						variable_struct_set(_submenus, _action.submenu, [[_nameandcount, menuselectaction, [_unit, _action], _available]]);
					}
					else
					{
						array_push(_submenus[$ _action.submenu], [_nameandcount, menuselectaction, [_unit, _action], _available]);
					}
				}
			}				
			//turn submenus into an array
			var _submenusarray = variable_struct_get_names(_submenus);
			for (var i = 0; i < array_length(_submenusarray); i++)
			{
				//sort submenu if needed
				//(here)
					
				//add option to go back at the end of menu
				array_push(_submenus[$ _submenusarray[i]], ["back", menugoback, -1, true]);
				//add submenu into main menu
				array_push(_menuoptions, [_submenusarray[i], submenu, [_submenus[$ _submenusarray[i]]], true]);
			}
			menu(x+10, y+110, _menuoptions, , 74, 60);
		}
		else
		{
			//enemy is ai
			var _enemyaction = _unit.AIscript();
			if (_enemyaction != -1)beginaction(_unit.id, _enemyaction[0], _enemyaction[1]);
		}
	}
}


function beginaction(_user, _action, _targets)
{
	currentuser = _user;
	currentaction = _action;
	
	
	currenttargets = _targets;
	
	battlestate = finishaction;
}





function finishaction()
{	
	battletext = string_ext(currentaction.description, [currentuser.name]);
	if (!is_array(currenttargets)) currenttargets = [currenttargets];
	
	battlewaittimeremaining = battlewaitframes;
	
	var _action = currentaction;
	var _user = currentuser;
	
	with (currentuser)
	{
		acting = true;
		//play user anim if it is defined for that user & action
		if (!is_undefined(_action[$ "useranimation"])) && (!is_undefined(_user.sprites[$ _action.useranimation]))
		{
			sprite_index = sprites[$ _action.useranimation];
			image_index = 0;
		}
	}
	battlestate = minigame;
	
}


function minigame()
{
	var _unit = turnorder[turn];
	var _actionlist = _unit.actions;
	var _currentminigame = currentaction.minigame;
	if spawnedminigame = false
	{
		_currentminigame();
	}
	
	if completedminigame = true
	{
		battlestate = battlestateperformaction;
	}
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
	spawnedminigame = false;
	completedminigame = false;
	global.minigame_multiplier = 1.0;
	
	refreshpartyhealthorder = function()
	{
		partyunitsbyhp = []
		array_copy(partyunitsbyhp,0, partyunits, 0, array_length(partyunits));
		array_sort(partyunitsbyhp, function(_1, _2)
		{
			return _2.hp - _1.hp;
		});
	}
	refreshpartyhealthorder();
	
	refreshenemyhealthorder = function()
	{
		enemyunitsbyhp = []
		array_copy(enemyunitsbyhp, 0, enemyunits, 0, array_length(enemyunits));
		array_sort(enemyunitsbyhp, function(_1, _2)
		{
			return _2.hp - _1.hp;
		});
	}
	
	refreshenemyhealthorder();
	
	if (partyunitsbyhp[0].hp <= 0)
	{
		instance_activate_all();
		instance_destroy(creator);
		instance_destroy();
		instance_deactivate_object(O_general_drawer);
		
		room_goto(R_loss_alpha1);
	}
	
	if (enemyunitsbyhp[0].hp <= 0)
	{
		for (var i = 0; i <array_length(global.party); i++)
		{
			global.party[i].hp = partyunits[i].hp
		}
		instance_activate_all();
		instance_destroy(creator);
		instance_destroy();
		
		O_player_rpg.x = O_teleport.x
		O_player_rpg.y = O_teleport.y
		
	}	
	
	battlestate = battlestateturnprogress;	
}

function battlestateturnprogress()
{
	//get current unit
	var _unit = turnorder[turn];
	var _playerunit = global.party[0]
	
	battletext = ""; //reset text
	if (_unit.object_index == O_battleunitplayer)
	{
		turncount += _playerunit.turns;
		turn += _playerunit.turns;
	}
	else
	{
		turncount++;
		turn++;
	}
	//loop turns
	if (turn > array_length(turnorder) - 1)
	{
		turn = 0;
		roundcount++;
	}
	
	battlestate = battlestateselectaction;
}

battlestate = battlestateselectaction;