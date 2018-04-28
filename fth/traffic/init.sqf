// TRAFFIC - INIT
// =================

// Declare local variables:
private ["_i","_half","_loc","_locs","_locs_mil","_locs_civ"];

// Create Centre for Civilian side; this is required to make new groups of AI on that side:
_CivsHQ = createCenter civilian;

// Split the waypoints evenly between military and civilian traffic:
_half = floor ((count fth_veh_object_wp_mkrs) / 2);
_i = _half;
_locs = fth_veh_object_wp_mkrs;
_locs_mil = [];
while {_i != 0} do {
	_loc = selectRandom _locs;
	_locs_mil = _locs_mil + [_loc];
	_locs = _locs - [_loc];
	_i = _i - 1;
};
_locs_civ = _locs;