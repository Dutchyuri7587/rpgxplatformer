//draw money
draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(300,150,string(global.money),5,5,0);

//draw attackmultiplier (debug)
draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(850,200,string(global.attackmultiplier),5,5,0);

//draw boughtsomething (debug)
draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(1250,200,string(global.boughtsomething),5,5,0);

//draw boughtsomething (debug)
draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(550,600,string(global.testvar),5,5,0);