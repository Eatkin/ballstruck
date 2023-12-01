enum ScoreboardStyle {
	PlayerOpponent,
	PlayerOnly,
	PlayerCountdown,
}

function level_end(_won)	{
	var vars = {
		win: _won
	};
	instance_create_layer(0, 0, layer, obj_level_end, vars);
	
	if (_won)	{
		instance_destroy(obj_opponent_paddle);
	}
	else	{
		instance_destroy(obj_player_paddle);
	}
}

function create_text_particle(xx, yy, txt)	{
	var vars = {
		text: txt,
	};
	instance_create_layer(xx, yy, layer, obj_text_particle, vars);
}

x_centre = room_width * 0.5;
y_centre = room_height * 0.1;
x_shift = string_width(" - ");

// Functions that we'll trigger with various ball events
function hit_left()	{
	switch (room)	{			
		case rm_level2:
			opponent_score++;
			break;
			
		default:
			create_text_particle(x_centre + x_shift, y_centre, string(player_score));
			player_score++;
			player_score_scale = 2;
			break;
	}
}
function hit_right()	{
	switch (room)	{			
		case rm_level2:
			create_text_particle(x_centre, y_centre, string(target_score - player_score));
			player_score++;
			player_score_scale = 2;
			break;
			
		default:
			create_text_particle(x_centre - x_shift, y_centre, string(opponent_score));
			opponent_score++;
			opponent_score_scale = 2;
			break;
	}
}

player_score = 0;
opponent_score = 0;
target_score = 0;
player_score_scale = 1;
opponent_score_scale = 1;

instance_create_layer(x, y, layer_get_id("UI"), obj_level_title);


switch (room)	{
	case rm_level1:
		scoreboard_style = ScoreboardStyle.PlayerCountdown;
		target_score = 1;
		break;
	case rm_level2:
		scoreboard_style = ScoreboardStyle.PlayerCountdown;
		target_score = 5;
		break;
	default:
		scoreboard_style = ScoreboardStyle.PlayerOpponent;
		break;
}

instance_create_layer(0, 0, layer, obj_camera);