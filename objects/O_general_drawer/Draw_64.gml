//draw money
draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(1600,90,"money: "+string(global.money),5,5,0);

//yo how loud is this beat???
draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(1400,190,"mastervolume: " + string(global.mastervolume),5,5,0);