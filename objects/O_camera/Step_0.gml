//fullscreen
if keyboard_check_pressed(vk_f4)
{window_set_fullscreen(!window_get_fullscreen());}

//exit if therres no player
if !instance_exists(O_player_plat) exit;

//get camera size
var _camwidth = camera_get_view_width(view_camera[0]);
var _camheight = camera_get_view_height(view_camera[0]);

//get coords
var _camX = O_player_plat.x - _camwidth/2;
var _camY = O_player_plat.y - _camheight/2;

//constrain camera to room bordsers
_camX = clamp(_camX, 0, room_width - _camwidth);
_camY = clamp(_camY, 0, room_height - _camheight);

//set cam coordinate variables
finalcamX += (_camX - finalcamX) * camtrailspeed;
finalcamY += (_camY - finalcamY) * camtrailspeed;

//set the coords
camera_set_view_pos(view_camera[0], _camX, _camY);