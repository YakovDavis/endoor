/// @description Init Vars

// Player Vars
move_rate = 4;
move_rate_ladder = 3;
jump_rate = 3;
jump_buffer_count = 10;
jump_buffer = 10;
jump_ledge_buffer = 10;
accel_rate_ground = 0.3;
accel_rate_air = 0.2;
accel_rate_ladder = 0.3;
brake_rate_ground = 0.4;
brake_rate_air = 0.2;
brake_rate_ladder = 0.5;
gravity_vspeed = 4;
gravity_rate = 0.2;
run_frame = 0.0;
idle_frame = 0.0;
facing = 1;
run_animation_speed = 0.5;
idle_animation_speed = 0.02;
idle_animation_margin = 0.2;
jumping = false;
col = c_white;

// Controls
control_left = ord("A");
control_right = ord("D");
control_up = ord("W");
control_down = ord("S");
control_jump = vk_space;

// Alternate Controls
control_left_alt = vk_left;
control_right_alt = vk_right;
control_up_alt = vk_up;
control_down_alt = vk_down;
control_jump_alt = vk_up;
