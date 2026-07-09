//draw money
draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(1600,90,"money: "+string(global.money),5,5,0);