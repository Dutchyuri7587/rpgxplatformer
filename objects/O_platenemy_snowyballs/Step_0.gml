if place_meeting(x,y,O_wall)
{
	xspeed *= -1;
	movedirection *= -1;
}

if hasbeenhit = true
{
	enemyinvincibilitytime--;
	if enemyinvincibilitytime <= 0
	{
		hasbeenhit = false;
	}
}

if (hits = 0)
{
	sprite_index = spr_stage0;
}

if (hits = 1)
{
	sprite_index = spr_stage1;
}

if (hits = 2)
{
	sprite_index = spr_stage2;
}

if (hits = 3)
{
	sprite_index = spr_stage3;
}

x += xspeed;