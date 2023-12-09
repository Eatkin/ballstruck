angle = max_angle * dsin(rot_counter);

rot_counter += rot_rate;
rot_counter %= 360 * 2;

scale = 1.2 + 0.3 * dcos(rot_counter / 2);

if (keyboard_check_pressed(vk_anykey) and yoffset == 0)	{
	instance_destroy();
	global.in_play = true;
}

yoffset = lerp(yoffset, 0, lerp_strength);
var threshold = 2;
if (yoffset < threshold)	{
	yoffset = 0;
}