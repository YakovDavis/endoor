/// @description Draw background in minigames

if (global.is_in_minigame)
{
	if (!surface_exists(global.snapshot_surface))
	{
		global.snapshot_surface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
		buffer_set_surface(global.game_display_buffer, global.snapshot_surface, 0);
	}
	draw_surface_part_ext(global.snapshot_surface, 0, 66, surface_get_width(global.snapshot_surface), surface_get_height(global.snapshot_surface) - 66, 0, 33, 0.5, 0.5, c_ltgray, 1.0);
	//draw_surface_ext(global.snapshot_surface, 0, 0, 0.5, 0.5, 0, c_ltgray, 1.0);
}

draw_text(room_width - 70, 11, string_format(global.seconds_passed, 1, 2));
if (global.seconds_passed > 1)
	draw_sprite(spr_clock, (ceil(global.seconds_passed) - 1) % 10, 160, 12)