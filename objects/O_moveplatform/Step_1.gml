//move in a circle
dir += rotspd;

//get our target positions
var _targetX = xstart + lengthdir_x(radius, dir);
var _targetY = ystart + lengthdir_y(radius, dir);

//get ou xspeed and yspeed
xspeed = _targetX - x;
if !moveonXaxis {xspeed = 0;};
yspeed = _targetY - y;
if !moveonYaxis {yspeed = 0;};

//move
x += xspeed;
y += yspeed;