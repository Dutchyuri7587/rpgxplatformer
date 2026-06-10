draw_self();
//draw hasbeenbought (debug)
draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(x,y,"€" + string(cost*global.sale));