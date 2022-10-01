/// @description Insert description here

if (!surface_exists(dust_surf))
{
	dust_surf = surface_create(128, 128);
    surface_set_target(dust_surf);
    draw_clear_alpha(c_white, 1);
	surface_reset_target();
}

surface_set_target(dust_surf);
draw_circle_color(mouse_x - x, mouse_y - y, 40, c_black, c_black, false)
success = true;
for (i = 1; i <= 12; i++)
{
	for (j = 1; j <= 12; j++)
	{
		if (surface_getpixel(dust_surf, i * 10, j * 10) == c_white)
			{
				success = false;
				break;
			}
	}
	if (!success)
		break;
}
if (success)
{
	global.is_in_minigame = false;
	room_goto(rm_main_level);
}
surface_reset_target();
