battlestate();

//set battle theme
if (room = rpgbattletest)
{
	roomtheme = 1;
}
if (room = rpgbattletest_1)
{
	roomtheme = 2;
}

//cursor control
if (cursor.active)
{
	with (cursor)
	{
		//input
		var _keyup = keyboard_check_pressed(vk_up) + keyboard_check_pressed(ord("W"));
		var _keydown = keyboard_check_pressed(vk_down) + keyboard_check_pressed(ord("S"));
		var _keyright = keyboard_check_pressed(vk_right) + keyboard_check_pressed(ord("D"));
		var _keyleft = keyboard_check_pressed(vk_left) + keyboard_check_pressed(ord("A"));
		var _keytoggle = false;
		var _keyconfirm = false
		var _keycancel = false;
		confirmdelay++
		if (confirmdelay > 1)
		{
			_keyconfirm = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
			_keycancel = keyboard_check_pressed(vk_backspace);
			_keytoggle = keyboard_check_pressed(vk_shift); //switch between single and multitarghet mode
		}
		var _movehorizontal = _keyright - _keyleft;
		var _movevertical = _keydown - _keyup;
		
		if (_movehorizontal == -1) targetside = O_battle_manager.partyunits;
		if (_movehorizontal == 1) targetside = O_battle_manager.enemyunits;
		
		//you cant target dead guys bozo
		if (targetside == O_battle_manager.enemyunits)
		{
			targetside = array_filter(targetside, function(_element, _index)
			{
				return _element.hp > 0;
			});
		}
		
		//move between targets
		if (targetall == false)
		{
			if (_movevertical == -1) targetindex++;
			if (_movevertical == 1) targetindex--;
			
			//wrap
			var _targets = array_length(targetside);
			if (targetindex < 0) targetindex = _targets - 1;
			if (targetindex > (_targets - 1)) targetindex = 0;
			
			//identify target
			activetarget = targetside[targetindex];
			
			//toggle all mode
			if (activeaction.targetall == MODE.VARIES) && (_keytoggle) //switch to all mode
			{
				targetall = true;
			}
		}
		else
		{
			activetarget = targetside;
			if (activeaction.targetall == MODE.VARIES) && (_keytoggle) //siwtch to single mode
			{
				targetall = false;
			}
		}
		
		//confirm action
		if (_keyconfirm)
		{
			with (O_battle_manager) beginaction(cursor.activeuser, cursor.activeaction, cursor.activetarget);
			with (O_menu) instance_destroy();
			active = false;
			confirmdelay = 0;
		}
		
		//cancel & return to menu
		if (_keycancel) && (!_keyconfirm)
		{
			with (O_menu) active = true;
			active = false;
			confirmdelay = 0;
		}
	}
}

/*if (haswonbattle = true)
{
	instance_deactivate_all(false);
}*/