
	if (bbox_bottom-4 <= O_platenemy.bbox_top)
	{
		show_message("you killed him :(");
		instance_destroy(other);
	}