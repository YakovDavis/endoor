/// @description Render player and control animations

if (jumping)
	draw_sprite_ext(spr_character, round(run_frame), x, y, facing, 1, 0, col, 1);
else
{
	if (abs(hspeed) > idle_animation_margin)
	{
		draw_sprite_ext(spr_character, round(run_frame), x, y, facing, 1, 0, col, 1);
		run_frame += run_animation_speed;
	}
	else
	{
		draw_sprite_ext(spr_character, round(idle_frame), x, y, facing, 1, 0, col, 1);
		idle_frame += idle_animation_speed;
	}
}
