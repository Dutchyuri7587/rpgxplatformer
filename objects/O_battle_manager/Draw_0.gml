//draw bg
if (roomtheme == 1)
{
	fightBG = S_battlebg_test;
	draw_sprite(fightBG,0,x,y);
}

if (roomtheme == 2)
{
	fightBG = S_battlebg_test_1
	draw_sprite(fightBG,0,x,y);
}


//draw units
var _unitwithcurrentturn = turnorder[turn].id;
for (var i = 0; i < array_length(renderorder); i++)
{
	with (renderorder[i])
	{
		draw_self();
	}
}

//draw money
draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(x+100,y+100,string(global.money));

//draw battle ui
draw_sprite_stretched(S_battlemenu, 0, x+75, y+120, 245, 60);
draw_sprite_stretched(S_battlemenu, 0, x, y+120, 74, 60);

//positions
#macro COLUMN_ENEMY 15
#macro COLUMN_NAME 90
#macro COLUMN_HP 160
#macro COLUMN_MP 220

//draw headings
draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_gray);
draw_text(x+COLUMN_ENEMY, y+120, "ENEMY");
draw_text(x+COLUMN_NAME, y+120, "NAME");
draw_text(x+COLUMN_HP, y+120, "HP");
draw_text(x+COLUMN_MP, y+120, "MP");

//draw enemy names
draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
var _drawlimit = 6;
var _drawn = 0;
for (var i = 0; (i < array_length(enemyunits)) && (_drawn < _drawlimit); i++)
{
	var _char = enemyunits[i];
	if (_char.hp > 0)
	{
		_drawn++;
		draw_set_halign(fa_left);
		draw_set_color(c_white);
		if (_char.id == _unitwithcurrentturn) draw_set_color(c_purple);
		draw_text(x+COLUMN_ENEMY,y+130+(i*12),_char.name);
	}
}

//draw party info
for (var i = 0; i < array_length(partyunits); i++)
{
	draw_set_halign(fa_left);
	draw_set_colour(c_white);
	var _char = partyunits[i];
	if (_char.id == _unitwithcurrentturn) draw_set_color(c_green);
	if (_char.hp <= 0) draw_set_color(c_red);
	draw_text(x+COLUMN_NAME, y+130+(i*12),_char.name);
	draw_set_halign(fa_right);
	
	draw_set_color(c_white);
	if (_char.hp < (_char.maxhp*0.5)) draw_set_color(c_orange);
	if (_char.hp <= 0) draw_set_color(c_red);
	draw_text(x+COLUMN_HP+50,y+130+(i*12),string(_char.hp) + "/" + string(_char.maxhp));
	
		draw_set_color(c_white);
	if (_char.mp < (_char.maxmp*0.5)) draw_set_color(c_orange);
	if (_char.mp <= 0) draw_set_color(c_red);
	draw_text(x+COLUMN_MP+50,y+130+(i*12),string(_char.mp) + "/" + string(_char.maxmp));
	
	draw_set_color(c_white);
}


//draw target cursor
if (cursor.active)
{
	with (cursor)
	{
		if (activetarget != noone)
		{
			if (!is_array(activetarget))
			{
				draw_sprite(S_target_cursor, 0, activetarget.x, activetarget.y);
			}
			else
			{
				draw_set_alpha(sin(get_timer()/50000)+1);
				for (var i = 0; i < array_length(activetarget); i++)
				{
					draw_sprite(S_target_cursor,0,activetarget[i].x, activetarget[i].y);
				}
				draw_set_alpha(1.0);
			}
		}
	}
}

//battle text
if (battletext != "")
{
	var _stringwidth = string_width(battletext)+20;
	draw_sprite_stretched(S_battlemenu, 0, x+160-(_stringwidth*0.5), y+5, _stringwidth, 25);
	draw_set_halign(fa_center);
	draw_set_colour(c_white);
	draw_text(x+160, y+10, battletext);
}