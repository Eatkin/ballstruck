if (!global.in_play)	{
	exit;
}

// Move up and down where possible
if (check_property(PlayerProperties.VerticalMovement))	{
	var vinput = max(keyboard_check(Input.Down), keyboard_check(Input.AltDown)) - max(keyboard_check(Input.Up), keyboard_check(Input.AltUp));
	var target_ys = vinput * maxspeed;
	// Check if target_ys has changed because if it has we need to change our easing timer
	if (target_ys != target_yspeed)
		y_accel_timer = 0;
		
	target_yspeed = target_ys;
	
	// Now we begin the easing towards our target speed
	y_accel_timer += y_accel_step;
	y_accel_timer = clamp(y_accel_timer, 0, 1);
	yspeed = target_yspeed * quint_out(y_accel_timer);
	
	// Move with collisions and whatever, account for room boundaries
	// No collision at the moment so just make sure we don't exceed room boundaries
	y += yspeed;
	if (bbox_bottom > room_height or bbox_top < 0)
		y = clamp(y, sprite_height * 0.5, room_height - sprite_height * 0.5);
}

if (check_property(PlayerProperties.Shrinkray))	{
	image_yscale = lerp(image_yscale, target_yscale, 0.1);
}