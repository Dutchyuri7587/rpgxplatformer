if (bbox_bottom-4 <= O_platenemy_snonwtest.bbox_top+2)
{
	enemyjumpkilltimer = enemyjumpkillframes;
	enemyjump();
	O_platenemy_snonwtest.hits += 1;
	if (O_platenemy_snonwtest.hits >= O_platenemy_snonwtest.maxhits)
	{
		instance_destroy(other);
	}
}