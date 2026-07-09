//show how many bullets
draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(80,90,"Bullets left: " + string(global.bullets),5,5,0);