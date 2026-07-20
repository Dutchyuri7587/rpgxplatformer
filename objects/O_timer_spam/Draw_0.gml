	draw_set_font(testfont);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text_transformed(x,y,"Timer: " + (string(timer/60)),1,1,0);