draw_set_alpha(image_alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite_ext(sprite, -1, x, y, xscale, yscale, 0, c_white, 1.0)
draw_set_alpha(1.0)

//example
/*instance_create_depth
		(
		x,
		y,
		depth-1,
		O_effectspawner,
		{sprite: S_platenemy_catbig, xscale: other.effectxscale, yscale: other.effectyscale}
		);
		instance_destroy(other.id);*/