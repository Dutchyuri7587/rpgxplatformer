if !hashitplayer
{
	other.invincibilitytime = other.invincibilityframes;
	other.gothitplayer = true;
	hashitplayer = true;
	global.plathp -= damage;
	playerhitkb();
}

