if (active)
{
	hover += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
	if (hover > array_length(options)-1) hover = 0;
	if (hover < 0) hover = array_length(options)-1;
	
	//do selected option
	if (keyboard_check_pressed(vk_enter))
	{
		if (array_length(options[hover]) > 1) && (options[hover][3] == true)
		{
			if (options[hover][1] != -1)
			{
				var _func = options[hover][1];
				if (options[hover][2] != -1) script_execute_ext(_func, options[hover][2]); else _func();
			}
		}
	}
	if (keyboard_check_pressed(vk_escape))
	{
		if (submenulevel > 0) menugoback();
	}
}

/*___________________________________________
############################################################################################
ERROR in action number 1
of  Step Event0 for object O_menu:
Variable O_menu._func(100135, -2147483648) not set before reading it.
 at gml_Object_O_menu_Step_0 (line 15) -                             if (options[hover][2] != -1) script_execute_ext(_func, options[hover][2]); else _func();
############################################################################################
gml_Object_O_menu_Step_0 (line 15)*/
