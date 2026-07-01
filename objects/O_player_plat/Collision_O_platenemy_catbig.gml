if (bbox_bottom-4 <= O_platenemy_catbig.bbox_top+2)
{
	enemyjumpkilltimer = enemyjumpkillframes;
	enemyjump();
	O_platenemy_catbig.hits += 1;
	if (O_platenemy_catbig.hits >= O_platenemy_catbig.maxhits)
	{
		instance_destroy(other);
	}
}