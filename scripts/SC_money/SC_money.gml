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
		O_battlefloatingtext,
		{font: testfont, col: c_white, text: string(moneyworth)}
		);
	}
}