//i'm debugging it.
//and by it? my hp.
draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(25,750,"hp: " + string(hp),5,5,0);

draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(25,900,"gothitplayer: " + string(gothitplayer),5,5,0);

draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(25,1000,"invinibibframes: " + string(invincibilitytime),5,5,0);