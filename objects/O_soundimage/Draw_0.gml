draw_self();

var _xvolume = 244;
var _yvolume = 135;

draw_set_font(font);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(col2);
draw_text_transformed(_xvolume+textoffset,_yvolume,string(round(global.mastervolume*100)) + "%",1,1,0);
draw_text_transformed(_xvolume-textoffset,_yvolume,string(round(global.mastervolume*100)) + "%",1,1,0);
draw_text_transformed(_xvolume,_yvolume+textoffset,string(round(global.mastervolume*100)) + "%",1,1,0);
draw_text_transformed(_xvolume,_yvolume-textoffset,string(round(global.mastervolume*100)) + "%",1,1,0);
draw_set_color(col);
draw_text_transformed(_xvolume,_yvolume,string(round(global.mastervolume*100)) + "%",1,1,0);