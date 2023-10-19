enum BallProperties {
	NormalMovement,
	Gravity,
	SpeedUp,
	Max
}

function apply_property(property)	{
	properties |= (1 << property)
}

function check_property(property)	{
	return (properties >> property & 1) == 1
}

// Physics
rotation_speed = 10;
rotation_dir = -1

maxspeed = 10;
xspeed = maxspeed;
yspeed = 0;
grav = 0.5;

properties = 0;

switch (room)	{
	case rm_level2:
		apply_property(BallProperties.NormalMovement);
		var _dir = 10 + irandom(30)
		_dir *= choose(1, -1)
		xspeed = -dcos(_dir) * maxspeed;
		yspeed = dsin(_dir) * maxspeed;
		break;
	case rm_level3:
		apply_property(BallProperties.Gravity);
		break;
	case rm_level5:
		apply_property(BallProperties.NormalMovement);
		apply_property(BallProperties.SpeedUp);
		break;
	default:
		apply_property(BallProperties.NormalMovement);
		break;
}