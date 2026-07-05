//global volume controle
global.mastervolume = 1;
global.musicvolume = 1;

//info for the song you try to play or is playing
songinstancing = noone;
which_song = noone
whichswapsong = how2philly_darnell_mix;
endfadeoutframes = 0; //amount of frames to fade out song with
startfadeinframes = 0; //amount of frames to fade in with
fadeininstvol = 1; //volume of songding

//fading out songs + stoppping them
fadeoutinsts = array_create(0); //the audio to fade out
fadeoutinstancevolume = array_create(0); //the volume of the induvidual song instances
fadeoutinstframes = array_create(0); //the speed of the fadeout

songoverlap = false;