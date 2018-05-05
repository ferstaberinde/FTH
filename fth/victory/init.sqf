// VICTORY - INIT
// ==============

// Declare local variables:
private ["_points_opf","_points_blu"];

// Begin the victory checking loop:
while {true} do {

	sleep fth_victory_delay;

	// Reset and then check points for OPFOR:
	_points_opf = 0;
	if (fuel fth_veh_th_opf > 0.75) then {_points_opf = _points_opf + 1};
	if (damage fth_veh_th_opf < 0.1) then {_points_opf = _points_opf + 1};
	if ((fth_veh_object distance fth_veh_th_opf) < 20) then {_points_opf = _points_opf + 1};
	if (_points_opf == 3) exitWith {[1] call f_fnc_mpEnd};

	// Reset and then check points for BLUFOR:
	_points_blu = 0;
	if (fuel fth_veh_th_blu > 0.75) then {_points_blu = _points_blu + 1};
	if (damage fth_veh_th_blu < 0.1) then {_points_blu = _points_blu + 1};
	if ((fth_veh_object distance fth_veh_th_blu) < 20) then {_points_blu = _points_blu + 1};
	if (_points_blu == 3) exitWith {[2] call f_fnc_mpEnd};

};