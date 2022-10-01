/// @description Draw the e-prompt

if (active)
{
	draw_sprite(spr_main_e_prompt, 0, x + local_prompt_x, y + local_prompt_y);
	active = false;
}
