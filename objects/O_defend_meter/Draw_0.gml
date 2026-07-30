draw_self();


if currentstage = 1
{
	sprite_index = spr_stage1;
}
if currentstage = 2
{
	sprite_index = spr_stage2;
}
if currentstage = 3
{
	sprite_index = spr_stage3;
}
if currentstage = 4
{
	sprite_index = spr_stage4;
}
if currentstage = 5
{
	sprite_index = spr_stage5;
}
if currentstage = 6
{
	sprite_index = spr_stage6;
}

draw_set_color(c_white);
draw_text_transformed(x-15,y-35,("holdframes: " + string(hold_frames)),1,1,0);