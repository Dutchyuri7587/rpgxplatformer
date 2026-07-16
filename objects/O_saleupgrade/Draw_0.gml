draw_self();
//draw hasbeenbought (debug)
draw_set_font(testfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(x+50,y+20,"€" + string(cost*global.sale));

if (mouse_x >= bbox_left) && (mouse_x <= bbox_right) && (mouse_y <= bbox_bottom) && (mouse_y >= bbox_top)
{
	draw_set_font(testfont);
	draw_set_halign(fa_left);
    draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text(x - bbox_right/8, y-15, "Everything will be 50% off!");
}