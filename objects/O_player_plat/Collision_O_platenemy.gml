
	if (bbox_bottom-4 <= O_platenemy.bbox_top+2)
	{
		

		
		instance_destroy(other);
		
				instance_create_depth
		(
		x,
		y,
		depth-1,
		O_effectspawnertest,
		{sprite: S_platenemy, xscale: 1, yscale: 1}
		);
		
		enemyjump();
		

	}
	