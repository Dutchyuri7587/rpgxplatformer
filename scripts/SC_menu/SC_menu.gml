//makes a menu - options provided in the form [["name", function, argument, is able to be selected?]
function SC_menu(_x, _y, _options, _description = -1, _width = undefined, _height = undefined){
	with (instance_create_depth(_x, _y, -999999, O_menu))
	{
		options = _options;
		description = _description;
		var _optionscount = array_length(_options); //how many options it has
		visibleoptionsmax = _optionscount;
		
		//set size
		x_margin = 10;
		y_margin = 8;
		draw_set_font(testfont);
		heightline = 12; //font height i believe
		
		//automatic width
		if (_width == undefined)
		{
			width = 1;
			if (description != -1) width = max(width, string_width(_description));
			for (var i = 0; i < _optionscount; i++)
			{
				width = max(width, string_width(_options[i][0]));
			}
			widthfull = width + x_margin * 2;
		} else widthfull = _width;
		
		//automatic height
		if (_height == undefined)
		{
			height = heightline * (_optionscount + !(description == -1));
			heightfull = height + y_margin * 2;
		}
		else
		{
			heightfull = _height;
			//scrolling?
			if (heightline * (_optionscount + !(description == -1)) > _height - (y_margin*2))
			{
				scrolling = true;
				visibleoptionsmax = (_height - y_margin * 2) div heightline;
			{
				
			}
		}
	}
}
}

function submenu(_options)
{
	//store old options in array and increase submenu level
	optionsabove[submenulevel] = options;
	submenulevel++;
	options = _options;
	hover = 0;
}

function menugoback()
{
	submenulevel--;
	options = optionsabove[submenulevel];
	hover = 0;
}