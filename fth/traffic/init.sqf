// TRAFFIC - INIT
// ==============

// Declare local variables:
private ["_i","_half","_eighth","_loc","_locs","_locs_mil","_locs_mil_mt","_locs_mil_mj","_locs_civ"];

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

// OLD BLOCK: Used to deliver 1:1:2 ratio of Technicals, Jeeps (carrying rebels) and Civilian traffic
// Initiate the creation of the military vehicles:
// _i = 0;
// {
// 	if (_i mod 2 == 0) then {
// 		null = [_x,"MT",_i] execVM "fth\traffic\create_traffic.sqf";
// 	} else {
// 		null = [_x,"MJ",_i] execVM "fth\traffic\create_traffic.sqf";
// 	};
// 	_i = _i + 1;
// } forEach _locs_mil;

// Initiate the creation of the military vehicles (1:3:4 ratio of Technicals, Jeeps and Civilian traffic)
_locs_mil_mt = [];
_locs_mil_mj = [];
_eighth = floor (_half / 4);
_i = _eighth;
while {_i != 0} do {
	_loc = selectRandom _locs_mil;
	_locs_mil_mt = _locs_mil_mt + [_loc];
	_locs_mil = _locs_mil - [_loc];
	_i = _i - 1;
};
_locs_mil_mj = _locs_mil;
_i = 0;
{
	null = [_x,"MT",_i] execVM "fth\traffic\create_traffic.sqf";
	_i = _i + 1;
} forEach _locs_mil_mt;
_i = 0;
{
	null = [_x,"MJ",_i] execVM "fth\traffic\create_traffic.sqf";
	_i = _i + 1;
} forEach _locs_mil_mj;

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

// hint format ["_half: %1\n_eighth: %2\n_locs_mil_mt: %3\n_locs_mil_mj: %4",_half,_eighth,_locs_mil_mt,_locs_mil_mj];