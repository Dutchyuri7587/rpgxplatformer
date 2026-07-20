draw_self();

draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(x-15,y-35,"Presses: " + string(presses) + "/" + string(neededpresses),1,1,0);