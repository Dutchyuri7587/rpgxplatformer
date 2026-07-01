
	if (bbox_bottom-4 <= O_platenemy_catbig.bbox_top+2)
	{
		enemyjump();
		O_platenemy_catbig.hits += 1;
		

		
		if (O_platenemy_catbig.hits >= O_platenemy_catbig.maxhits)
		{
			instance_destroy(other);
			
			instance_create_depth
			(
			x,
			y,
			depth-1,
			O_effectspawnertest,
			{sprite: S_platenemy_catbig, xscale: 2, yscale: 2}
			);
		}

	}
	