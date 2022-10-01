/// @description Control Player

//show_debug_message(place_meeting(x, y + 1, obj_wall_collision));

if (global.is_paused)
	exit;

if (!place_meeting(x, y, obj_ladder) && place_meeting(x, y + 1, obj_ladder) && !place_meeting(x, y + 1, obj_wall_collision))
{
	if keyboard_check(control_down) || keyboard_check(control_down_alt)
		y += 1;
}

//On ladder
if (place_meeting(x, y, obj_ladder))
{
	move_h_input_total = 0;
	move_v_input_total = 0;
	if keyboard_check(control_left) || keyboard_check(control_left_alt) { move_h_input_total -= 1; }
	if keyboard_check(control_right) || keyboard_check(control_right_alt) { move_h_input_total += 1; }
	if keyboard_check(control_up) || keyboard_check(control_up_alt) { move_v_input_total -= 1; }
	if keyboard_check(control_down) || keyboard_check(control_down_alt) { move_v_input_total += 1; }
	if move_h_input_total == 0 || (hspeed * move_h_input_total < 0)
	{
		hspeed -= hspeed * brake_rate_ladder;
	}
	hspeed += move_h_input_total * accel_rate_ladder;
	hspeed = clamp(hspeed, -move_rate_ladder, move_rate_ladder);
	if move_v_input_total == 0
	{
		vspeed -= vspeed * brake_rate_ladder;
	}
	vspeed += move_v_input_total * accel_rate_ladder;
	vspeed = clamp(vspeed, -move_rate_ladder, move_rate_ladder);
	if (place_meeting(x + hspeed, y, obj_wall_collision)) {
		while (!place_meeting(x + sign(hspeed), y, obj_wall_collision)) {
			x += sign(hspeed);
		}
		hspeed = 0;
	}
	if (place_meeting(x, y + vspeed, obj_wall_collision)) {
		while (!place_meeting(x, y + sign(vspeed), obj_wall_collision)) {
			y += sign(vspeed);
		}
		vspeed = 0;
	}
	
	if (place_meeting(x + hspeed, y + vspeed, obj_wall_collision)) {
		while (!place_meeting(x + sign(hspeed), y + sign(vspeed), obj_wall_collision)) {
			x += sign(hspeed);
			y += sign(vspeed);
		}
		hspeed = 0;
		vspeed = 0;
		}

	if (hspeed != 0)
		facing = sign(hspeed);
	else
	{
		if (move_input_total != 0)
			facing = sign(move_input_total)
		else
			facing = 1;
	}
	exit;
}

// Get input
move_input_total = 0;
if keyboard_check(control_left) || keyboard_check(control_left_alt) { move_input_total -= 1; }
if keyboard_check(control_right) || keyboard_check(control_right_alt) { move_input_total += 1; }
// Jump input buffer
if keyboard_check_pressed(control_jump) || keyboard_check_pressed(control_jump_alt)
{
   jump_buffer_count = 0;
}
// Check / increment jump buffer
if jump_buffer_count < jump_buffer
{
   jump_buffer_count++;
}


// No move input, brake
// On ground
if (place_meeting(x, y + 1, obj_wall_collision) || place_meeting(x, y + 1, obj_ladder))
{
   if move_input_total == 0 || (hspeed * move_input_total < 0)
   {
       hspeed -= hspeed * brake_rate_ground;
   }
}
// In air
if !(place_meeting(x, y + 1, obj_wall_collision) || place_meeting(x, y + 1, obj_ladder))
{
   if move_input_total == 0 || (hspeed * move_input_total < 0)
   {
       hspeed -= hspeed * brake_rate_air;
   }
}

// Move player and clamp value to max
// On ground
if (place_meeting(x, y + 1, obj_wall_collision) || place_meeting(x, y + 1, obj_ladder))
{
   hspeed += move_input_total * accel_rate_ground;
   jumping = false;
}
	   
// In air
if !(place_meeting(x, y + 1, obj_wall_collision) || place_meeting(x, y + 1, obj_ladder))
{
   hspeed += move_input_total * accel_rate_air;
   jumping = true;
}
// Limit speed to move_rate
hspeed = clamp(hspeed, -move_rate, move_rate);

// Gravity
if ((vspeed < gravity_vspeed) && !place_meeting(x, y + 1, obj_wall_collision) && !place_meeting(x, y + 1, obj_ladder))
{
   vspeed += gravity_rate;
}

// Jump if on / close to ground
// Account for ledge buffer but prevent wall jumping
if (place_meeting(x + jump_ledge_buffer, y + 1, obj_wall_collision) && jump_buffer_count < jump_buffer && !place_meeting(x + 1, y, obj_wall_collision)) ||
   (place_meeting(x - jump_ledge_buffer, y + 1, obj_wall_collision) && jump_buffer_count < jump_buffer && !place_meeting(x - 1, y, obj_wall_collision))
{
   /*if (!audio_is_playing(snd_jump))
	audio_play_sound(snd_jump, 0, false);*/
   vspeed = 1 * -jump_rate;
}
if (place_meeting(x + jump_ledge_buffer, y + 1, obj_ladder) && jump_buffer_count < jump_buffer && !place_meeting(x + 1, y, obj_ladder)) ||
   (place_meeting(x - jump_ledge_buffer, y + 1, obj_ladder) && jump_buffer_count < jump_buffer && !place_meeting(x - 1, y, obj_ladder))
{
   /*if (!audio_is_playing(snd_jump))
	audio_play_sound(snd_jump, 0, false);*/
   vspeed = 1 * -jump_rate;
}

// Collisions and stuck/overlap prevention
if (place_meeting(x + hspeed, y, obj_wall_collision)) {
   while (!place_meeting(x + sign(hspeed), y, obj_wall_collision)) {
       x += sign(hspeed);
   }
   hspeed = 0;
}
if (place_meeting(x, y + vspeed, obj_wall_collision)) {
   while (!place_meeting(x, y + sign(vspeed), obj_wall_collision)) {
       y += sign(vspeed);
   }
   
   vspeed = 0;
}
if (place_meeting(x, y + vspeed, obj_ladder)) {
   vspeed = 0;
}

// Diagonal
if (place_meeting(x + hspeed, y + vspeed, obj_wall_collision)) {
   while (!place_meeting(x + sign(hspeed), y + sign(vspeed), obj_wall_collision)) {
       x += sign(hspeed);
       y += sign(vspeed);
   }
   hspeed = 0;
   vspeed = 0;
}

if (hspeed != 0)
	facing = sign(hspeed);
else
{
	if (move_input_total != 0)
		facing = sign(move_input_total)
	else
		facing = 1;
}

/*if ((abs(hspeed) > idle_animation_margin)&&(!audio_is_playing(snd_steps)))
{
	audio_play_sound(snd_steps, 0, true);
}
if (abs(hspeed) <= idle_animation_margin)
{
	audio_stop_sound(snd_steps);
}*/

// Speed debug
/*show_debug_message("HInput: " + string(move_input_total));
show_debug_message("Jump Buffer Count: " + string(jump_buffer_count));
show_debug_message("-global.world_hspeed: " + string(-global.world_hspeed));
show_debug_message("-global.world_vspeed: " + string(-global.world_hspeed));*/