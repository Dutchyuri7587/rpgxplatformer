function givemoney()
{
	if (hasgivenmoney = false)
	{
		hasgivenmoney = true;
		global.money += moneyworth;
		
		//draw text that fadessssssss
		instance_create_depth
		(
		x,
		y,
		depth-1,
		O_floatingtext,
		{font: testfont, col: c_white, text: string(moneyworth)}
		);
	}
}

function givemoneyenemy()
{
	if (other.hasgivenmoney = false)
	{
		other.hasgivenmoney = true;
		global.money += other.moneyworth;
		
		//draw text that fadessssssss
		instance_create_depth
		(
		x,
		y,
		depth-1,
		O_floatingtext,
		{font: testfont, col: c_white, text: string(other.moneyworth)}
		);
	}
}

function givemoneyrpg()
{
	if (hasgivenmoney = false)
	{
		hasgivenmoney = true;
		global.money += moneyworth;
	}
}