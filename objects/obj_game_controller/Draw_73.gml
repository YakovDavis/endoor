/// @description Insert description here

if (!global.is_in_minigame)
{
	if (!surface_exists(global.snapshot_surface))
		global.snapshot_surface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
	surface_copy(global.snapshot_surface, 0, 0, application_surface);
}