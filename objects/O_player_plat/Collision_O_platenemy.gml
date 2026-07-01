
	if (bbox_bottom-4 <= O_platenemy.bbox_top)
	{
		instance_destroy(other);
		enemyjumpkilltimer = enemyjumpkillframes;
		enemyjump();
	}
	