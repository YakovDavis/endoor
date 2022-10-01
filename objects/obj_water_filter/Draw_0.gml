/// @description Insert description here

draw_sprite(spr_water_filter, -1, x, y);

if (!surface_exists(dust_surf))
{
	dust_surf = surface_create(128, 128);
    surface_set_target(dust_surf);
    draw_clear_alpha(c_white, 1);
	surface_reset_target();
}

dust_mask = sprite_create_from_surface(dust_surf, 0, 0, sprite_width, sprite_height, false, false, 0, 0);
sprite_set_alpha_from_sprite(dust_sprite, dust_mask);
draw_sprite(dust_sprite, -1, x, y);
sprite_delete(dust_mask);
