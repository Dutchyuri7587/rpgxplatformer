if paused == true
{
	if !surface_exists(paused_surface)
	{}
	else
    {
		draw_set_font(testfont);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text_transformed_colour(960, 540, "PAUSED", 10, 10, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
    }
}