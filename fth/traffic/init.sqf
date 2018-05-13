// TRAFFIC - INIT
// ==============

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

// Initiate the creation of the military vehicles:
_i = 0;
{
	if (_i mod 2 == 0) then {
		null = [_x,"MT",_i] execVM "fth\traffic\create_traffic.sqf";
	} else {
		null = [_x,"MJ",_i] execVM "fth\traffic\create_traffic.sqf";
	};
	_i = _i + 1;
} forEach _locs_mil;

// Initiate the creation of the civilan vehicles:
_i = 0;
{
	null = [_x,"C",_i] execVM "fth\traffic\create_traffic.sqf";
	_i = _i + 1;
} forEach _locs_civ;

// Initiate the creation of the parked civilan vehicles:
{
	null = [_x] execVM "fth\traffic\create_parked.sqf";
} forEach fth_veh_civ_pv_mkrs;