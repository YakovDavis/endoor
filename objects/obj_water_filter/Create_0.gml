/// @description Insert description here

dust_surf = surface_create(sprite_width, sprite_height);
surface_set_target(dust_surf);
draw_clear_alpha(c_white, 1);
surface_reset_target();
dust_sprite = sprite_duplicate(spr_water_filter_dust);
