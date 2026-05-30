draw_sprite_stretched(S_battlemenu, 0, x, y, widthfull, heightfull);
draw_set_color(c_white);
draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _desc = !(description == -1);
var _scrollpush = max(0, hover - (visibleoptionsmax-1));

for (l = 0; 1 < (visibleoptionsmax + _desc); l++)
{
	if (l >= array_length(options)) break;
	draw_set_color(c_white);
	if (l == 0) & (_desc)
	{
		draw_text(x + x_margin, y +y_margin, description);
	}
	else
	{
		var _optionstoshow = l - _desc + _scrollpush;
		var _str = options[_optionstoshow][0];
		if (hover == _optionstoshow - _desc)
		{
			draw_set_colour(c_yellow);
		}
		if (options[_optionstoshow][3] == false) draw_set_color(c_gray);
		draw_text(x + x_margin, y + y_margin + l * heightline, _str);
	}
}

draw_sprite(S_battleselector, 0, x +x_margin + 8, y + y_margin + ((hover - _scrollpush) * heightline) + 7);
if (visibleoptionsmax <array_length(options)) && (hover < array_length(options)-1)
{
	draw_sprite(S_downarrow, 0, x +widthfull * 0.5, y + heightfull - 7);
}