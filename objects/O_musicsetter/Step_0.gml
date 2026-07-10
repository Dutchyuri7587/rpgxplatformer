var _finalvolume = global.musicvolume*global.mastervolume;

if keyboard_check_pressed(ord("5"))
{
	global.mastervolume -= 0.1;
	clamp(global.mastervolume, 0,1);
}

if keyboard_check_pressed(ord("6"))
{
	global.mastervolume += 0.1;
	clamp(global.mastervolume, 0,1);
}

//play the target song
if which_song != whichswapsong
{
	//tell old song to fuckoff
	if audio_is_playing(songinstancing)
	{
		//add our songinstancing to our array of songs to deletus fetus
		array_push(fadeoutinsts, songinstancing);
		//add the songs starting volume so theres no weird change in volume
		array_push(fadeoutinstancevolume, fadeininstvol);
		//add the fadeoutinstance's fade out frames
		array_push(fadeoutinstframes, endfadeoutframes);
		
		//reset the songinstancing and which_song variables
		songinstancing = noone;
		which_song = noone;
	}
	
	
	//actually play the song, if the old song is gone
	if array_length(fadeoutinsts) == 0 || songoverlap == true
	{
		if audio_exists(whichswapsong)
		{
			//start the song and store it's instance in a variable
			songinstancing = audio_play_sound(whichswapsong, 4, true);
			
			//tart the songs volume on 0
			audio_sound_gain( songinstancing, 0, 0 );
			fadeininstvol = 0;
		}
		//set de which_song to match the
		which_song = whichswapsong;
		songoverlap = false;
	}
}


//volume control
	//main song volume
	if audio_is_playing(songinstancing)
	{
		//fade song in
		if startfadeinframes > 0
		{
			if fadeininstvol < 1 { fadeininstvol += 1/startfadeinframes; } else fadeininstvol = 1;
		}
		//immediatly start the song if the fade in time is 0 frames
		else
		{
			fadeininstvol = 1;
		}
	
		//actually set the gain
		audio_sound_gain(songinstancing, fadeininstvol*_finalvolume, 0);
	}
	//fading songs out
	for(var i = 0; i < array_length(fadeoutinsts); i++)
	{
		//fade the volume
		if fadeoutinstframes[i] > 0
		{
			if fadeoutinstancevolume[i] > 0 {fadeoutinstancevolume[i] -= 1/fadeoutinstframes[i]; };
		}
		// cut volume to 0 otherwise
		else
		{
			fadeoutinstancevolume[i] = 0;
		}
		
		//actually set gain
		audio_sound_gain(fadeoutinsts[i], fadeoutinstancevolume[i]*_finalvolume, 0);
		
		//stop the song when its silent and remove from arrays
		if fadeoutinstancevolume[i] <= 0
		{
			//stop song
			if audio_is_playing(fadeoutinsts[i]) {audio_stop_sound(fadeoutinsts[i]);};
			//delete from arrays
			array_delete(fadeoutinsts, i, 1);
			array_delete(fadeoutinstancevolume, i, 1);
			array_delete(fadeoutinstframes, i, 1);
			//set the loop back 1 since we just deleted an entry
			i--;
		}
	}