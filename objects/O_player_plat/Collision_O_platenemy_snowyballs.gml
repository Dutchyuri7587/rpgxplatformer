if (bbox_bottom-4 <= O_platenemy_snowyballs.bbox_top+2)
{

	enemyjump();
	O_platenemy_snowyballs.hits += 1;
	
	instance_create_depth
	(
	x,
	y,
	depth-1,
	O_effectspawnertest,
	{sprite: S_platenemy_stage3, xscale: 1, yscale: 1}
	);
	
	if (O_platenemy_snowyballs.hits >= O_platenemy_snowyballs.maxhits)
	{
		instance_destroy(other);
	}
}