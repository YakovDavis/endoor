/// @description Take a snapshot of the room and put it in a buffer to prepare for room transition

if (global.next_minigame == "none")
	exit;

if (surface_exists(global.snapshot_surface))
	buffer_get_surface(global.game_display_buffer, global.snapshot_surface, 0);

global.is_in_minigame = true;

if (global.next_minigame == "pipe")
	room_goto(rm_minigame_pipe);
if (global.next_minigame == "air")
	room_goto(rm_minigame_air);
if (global.next_minigame == "filter")
	room_goto(rm_minigame_filter);
if (global.next_minigame == "lamp")
	room_goto(rm_minigame_lamp);
if (global.next_minigame == "radio")
	room_goto(rm_minigame_radio);
if (global.next_minigame == "tv")
	room_goto(rm_minigame_tv);