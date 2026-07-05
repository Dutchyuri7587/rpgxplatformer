draw_sprite_ext(sprite_index, image_index, x, y, image_xscale*face, image_yscale, image_angle, image_blend, image_alpha)

if invincibilitytime > 0
{
	if image_alpha >= 1
	{
		alpha_amount = 0.15;
	}
	if image_alpha <= 0
	{
		alpha_amount = -0.15;
	}
	image_alpha -= alpha_amount
}

if invincibilitytime <= 0
{
	image_alpha = 1;
}