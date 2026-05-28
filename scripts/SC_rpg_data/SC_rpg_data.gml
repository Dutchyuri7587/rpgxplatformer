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
			with (_targets[0]) hp = max(0, hp - _damage);
		}
	}
	
}	

enum MODE
{
	NEVER = 0,
	ALWAYS = 1,
	VARIES = 2,
}
		
//party data
global.party =
[
	{
		name: "player",
		hp: 500,
		maxhp: 500,
		mp: 50,
		maxmp: 50,
		strength: 5,
		sprites: {idle: S_player_rpg_idle, attack: S_player_rpg_attack, defend: S_player_rpg_defend, downed: S_player_rpg_downed},
		actions: []
	}
];

//enemy data
global.enemies =
{
	testenemy:
	{
		name: "testenemy",
		hp: 50,
		Maxhp: 50,
		mp: 0,
		Maxmp: 0,
		strength: 2,
		sprites: {idle: S_testenemy_idle, attack: S_testenemy_attack},
		actions: [],
		XPvalue: 5,
		AIscript: function()
		{
			//here you put the ai
		}
	}
}