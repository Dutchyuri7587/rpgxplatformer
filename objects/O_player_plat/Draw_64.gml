if room != R_shop_alpha2
{
	//i'm debugging it.
	//and by it? my hp.
	draw_set_font(testfont);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text_transformed(100,90,"HP: " + string(global.plathp),5,5,0);

	//and by it? my hp.
	draw_set_font(testfont);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text_transformed(100,190,"MaxHP: " + string(global.maxplathp),5,5,0);

	//MP
	draw_set_font(testfont);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text_transformed(100,290,"MP: " + string(mp),5,5,0);
}
