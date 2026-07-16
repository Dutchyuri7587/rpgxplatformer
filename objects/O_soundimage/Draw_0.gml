draw_self();

draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(244,135,string(global.mastervolume),1,1,0);