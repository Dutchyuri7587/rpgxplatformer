if room != R_shop_alpha2
{
	var _xhp = 100;
	var _yhp = 90;
	
	var _xmaxhp = 100;
	var _ymaxhp = 190;
	
	var _xmp = 100;
	var _ymp = 290;
	//and by it? my hp.
	draw_set_font(font);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(col2);
	draw_text_transformed(_xhp+textoffset,_yhp,"HP: " + string(global.plathp),5,5,0);
	draw_text_transformed(_xhp-textoffset,_yhp,"HP: " + string(global.plathp),5,5,0);
	draw_text_transformed(_xhp,_yhp+textoffset,"HP: " + string(global.plathp),5,5,0);
	draw_text_transformed(_xhp,_yhp-textoffset,"HP: " + string(global.plathp),5,5,0);
	draw_set_colour(col)
	draw_text_transformed(_xhp,_yhp,"HP: " + string(global.plathp),5,5,0);
	

	//max hp
	draw_set_font(font);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(col2);
	draw_text_transformed(_xmaxhp+textoffset,_ymaxhp,"MaxHP: " + string(global.maxplathp),5,5,0);
	draw_text_transformed(_xmaxhp-textoffset,_ymaxhp,"MaxHP: " + string(global.maxplathp),5,5,0);
	draw_text_transformed(_xmaxhp,_ymaxhp+textoffset,"MaxHP: " + string(global.maxplathp),5,5,0);
	draw_text_transformed(_xmaxhp,_ymaxhp-textoffset,"MaxHP: " + string(global.maxplathp),5,5,0);
	draw_set_color(col);
	draw_text_transformed(_xmaxhp,_ymaxhp,"MaxHP: " + string(global.maxplathp),5,5,0);

	//MP
	draw_set_font(font);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(col2);
	draw_text_transformed(_xmp+textoffset,_ymp,"MP: " + string(mp),5,5,0);
	draw_text_transformed(_xmp-textoffset,_ymp,"MP: " + string(mp),5,5,0);
	draw_text_transformed(_xmp,_ymp+textoffset,"MP: " + string(mp),5,5,0);
	draw_text_transformed(_xmp,_ymp-textoffset,"MP: " + string(mp),5,5,0);
	draw_set_color(col);
	draw_text_transformed(_xmp,_ymp,"MP: " + string(mp),5,5,0);
}