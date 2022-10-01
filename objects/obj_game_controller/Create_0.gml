/// @description Init game

if (variable_global_exists("initialized"))
	exit;
	
global.initialized = true;

global.is_paused = false;
global.is_in_minigame = false;
global.next_minigame = "none";

global.game_display_buffer = buffer_create(surface_get_width(application_surface) * surface_get_height(application_surface) * 4, buffer_fixed, 1);

global.snapshot_surface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));

global.seconds_passed = 0;

draw_set_colour(c_white);
draw_set_font(fnt_main);