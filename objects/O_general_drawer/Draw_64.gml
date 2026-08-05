if room != R_Title_screen && room != R_loss_alpha2
{
	
	var _xmoney = 1600;
	var _ymoney = 90;
	
	var _xmusic = 1400;
	var _ymusic = 190;
	//draw money
	draw_set_font(font);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(col2);
	draw_text_transformed(_xmoney+offsetamount,_ymoney,"money: "+string(global.money),5,5,0);
	draw_text_transformed(_xmoney-offsetamount,_ymoney,"money: "+string(global.money),5,5,0);
	draw_text_transformed(_xmoney,_ymoney+offsetamount,"money: "+string(global.money),5,5,0);
	draw_text_transformed(_xmoney,_ymoney-offsetamount,"money: "+string(global.money),5,5,0);
	draw_set_colour(col);
	draw_text_transformed(_xmoney,_ymoney,"money: "+string(global.money),5,5,0);

	//yo how loud is this beat???
	draw_set_font(font);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(col2);
	draw_text_transformed(_xmusic+offsetamount,_ymusic,("mastervolume: " + string(round(global.mastervolume*100)) + "%"),5,5,0);
	draw_text_transformed(_xmusic-offsetamount,_ymusic,("mastervolume: " + string(round(global.mastervolume*100)) + "%"),5,5,0);
	draw_text_transformed(_xmusic,_ymusic+offsetamount,("mastervolume: " + string(round(global.mastervolume*100)) + "%"),5,5,0);
	draw_text_transformed(_xmusic,_ymusic-offsetamount,("mastervolume: " + string(round(global.mastervolume*100)) + "%"),5,5,0);
	draw_set_colour(col);
	draw_text_transformed(_xmusic,_ymusic,("mastervolume: " + string(round(global.mastervolume*100)) + "%"),5,5,0);
	
}

if asset_has_tags(room, rpgtag, asset_room)
{
	var _x = 80;
	var _y = 90;
	//show how many bullets
	draw_set_font(font);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(col2);
	draw_text_transformed(_x+offsetamount, _y, "Bullets left: " + string(global.bullets),5,5,0);
	draw_text_transformed(_x-offsetamount, _y, "Bullets left: " + string(global.bullets),5,5,0);
	draw_text_transformed(_x, _y+offsetamount, "Bullets left: " + string(global.bullets),5,5,0);
	draw_text_transformed(_x, _y-offsetamount, "Bullets left: " + string(global.bullets),5,5,0);
	draw_set_colour(col);
	draw_text_transformed(_x, _y, "Bullets left: " + string(global.bullets),5,5,0);
}