//play the correct music

if room = R_Title_screen
{
	set_song_ingame(parappa_stage_4_cool_i_think__no_ending_lyrics, 20, 0);
}

if room = hubworld
{
	set_song_ingame(how2philly_darnell_mix, 20, 0);
}

if room = Shoptest
{
	set_song_ingame(Funkinlite_fresh, 10, 0);
}

if room = R_shoprpg1
{
	set_song_ingame(Funkinlite_fresh, 10, 0);
}

if room = R_shopplatformer1
{
	set_song_ingame(Funkinlite_fresh, 10, 0);
}

if room = R_platformer1
{
	set_song_ingame(Pico_darnell_mix, 10, 0);
}

if room = R_rpg1
{
	set_song_ingame(cliffs, 10, 0);
}

if room = R_shop_alpha2
{
	var _random_shop_music = irandom_range(1,3)
	{
		if _random_shop_music = 1
		{
			set_song_ingame(Quik_Build_TLLTD_OST, 10, 0);
		}
		if _random_shop_music = 2
		{
			set_song_ingame(TC_Reno_TLLTD_OST, 10, 0);
		}
		if _random_shop_music = 3
		{
			set_song_ingame(Cafe_RHG_OST, 10, 0);
		}
	}
}

if room = R_platformer1_alpha2
{
	set_song_ingame(field_of_hopes_loop, 10, 0);
}

if room = R_platformer2_alpha2
{
	set_song_ingame(field_of_hopes_loop, 10, 0);
}