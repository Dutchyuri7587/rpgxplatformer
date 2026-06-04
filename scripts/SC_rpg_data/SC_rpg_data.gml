//scripts are all run once you start the game, so this data gets setup on start!

//action library
global.actionlibrarby =
{
	attack:
	{
		name: "Hit",
		description: "{0} hits an enemy!",
		submenu: -1, //whar?
		targetrequired: true,
		targetenemybydefault: true,
		targetall: MODE.NEVER,
		useranimation: "attack",
		effectsprite: S_rpg_hitfx,
		effectontarget: MODE.ALWAYS,
		func: function(_user, _targets)
		{
			var _damage = ceil(_user.strength + random_range(_user.strength * 0.25, _user.strength * 0.25));
			battlechangehp(_targets[0], -_damage, 0);
		}
	},
	magic:
	{
		name: "magic",
		description: "{0} magic's an enemy!",
		submenu: "magic", //whar?
		mpcost: 4,
		targetrequired: true,
		targetenemybydefault: true,
		targetall: MODE.NEVER,
		useranimation: "attack",
		effectsprite: S_rpg_hitfx,
		effectontarget: MODE.ALWAYS,
		func: function(_user, _targets)
		{
			var _damage = irandom_range(10, 15);
			battlechangehp(_targets[0], -_damage);
			battlechangemp(_user, -mpcost)
		}
	},
	magichitall:
	{
		name: "magic",
		description: "{0} magic's an enemy!",
		submenu: "magic", //whar?
		mpcost: 4,
		targetrequired: true,
		targetenemybydefault: true,
		targetall: MODE.VARIES,
		useranimation: "attack",
		effectsprite: S_rpg_hitfx,
		effectontarget: MODE.ALWAYS,
		func: function(_user, _targets)
		{
			var _damage = irandom_range(10, 15);
			battlechangehp(_targets[0], -_damage);
			battlechangemp(_user, -mpcost)
		}
	}
	
}	

enum MODE
{
	NEVER = 0,
	ALWAYS = 1,
	VARIES = 2, //multi tasrget
}
		
//party data
global.party =
[
	{
		name: "player",
		hp: 500,
		maxhp: 500,
		mp: 2,
		maxmp: 50,
		minmp: 0,
		strength: 5,
		sprites: {idle: S_player_rpg_idle, attack: S_player_rpg_attack, defend: S_player_rpg_defend, downed: S_player_rpg_downed},
		actions: [global.actionlibrarby.attack, global.actionlibrarby.magic, global.actionlibrarby.magichitall]
	}
];

//enemy data
global.enemies =
{
	testenemy:
	{
		name: "testenemy",
		hp: 50,
		maxhp: 50,
		mp: 0,
		maxmp: 0,
		strength: 2,
		sprites: {idle: S_testenemy_idle, attack: S_testenemy_attack},
		actions: [global.actionlibrarby.attack],
		XPvalue: 5,
		AIscript: function()
		{
			//attack player
			var _action = actions[0];
			var _possibletargets = array_filter(O_battle_manager.partyunits, function(_unit, _index)
			{
				return (_unit.hp > 0);
			});
			var _target = _possibletargets[irandom(array_length(_possibletargets)-1)];
			return [_action, _target];
		}
	}
}