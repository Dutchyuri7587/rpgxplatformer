	if (bbox_bottom-4 <= O_platenemy.bbox_top+2)
	{
		O_platenemy.hasbeenhit = true;
		enemyjump();
		O_platenemy.hits += 1;
		
		if (O_platenemy.hits >= O_platenemy.maxhits)
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
		}

	}


if (!O_platenemy.id.hasbeenhit)
{
	hp -= O_platenemy.damage;
}