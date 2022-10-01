/// @description Do context action

trigger = instance_place(x, y, obj_minigame_trigger)

if (trigger != noone)
{
	global.next_minigame = trigger.minigame_name;
	event_perform_object(obj_game_controller, ev_other, ev_user0);
}
