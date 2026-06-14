function set_song_ingame(_song, _fadeout_current_song = 0, _fadeinframes = 0, _songoverlap = false)
{
	//_song = set to any song (including "noone" to stop or fade the track out)
	//_fadeout_current_song = time (in frames) the current song (if playing) will take to fadeout
	//_fadeinframes = time (in frames) the target song (if not "noone") will take to fade into reality
	
	with(O_musicsetter)
	{
		whichswapsong = _song;
		endfadeoutframes = _fadeout_current_song;
		startfadeinframes = _fadeinframes;
		songoverlap = _songoverlap;
	}
}

