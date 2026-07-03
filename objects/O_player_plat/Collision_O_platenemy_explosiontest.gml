
	if (bbox_bottom-4 <= O_platenemy_explosiontest.bbox_top+2)
	{
		enemyjump();
		O_platenemy_explosiontest.hits += 1;
		
		if (O_platenemy_explosiontest.hits >= O_platenemy_explosiontest.maxhits)
		{
			instance_create_depth(x,y, -9999999, O_explosion);
			instance_destroy(O_platenemy_explosiontest.id);
		}

	}
	