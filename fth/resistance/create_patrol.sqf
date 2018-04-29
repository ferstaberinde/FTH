// RESISTANCE - CREATE PATROL
// ==========================

// Declare local variables:
private ["_spt_mkr","_grp","_delta","_extra","_soldier","_i","_grp_mkrName","_grp_mkr"];

// Populate some local variables using values passed to the script:
_spt_mkr = _this select 0;

// Calculate size of the patrol:
_delta = floor ((fth_veh_supports_pat_max - fth_veh_supports_pat_min) / 2);
_extra = floor random _delta;

// Create a group for the patrol:
_grp = createGroup resistance;

// Create soldiers and add them to the group:
_i = fth_veh_supports_pat_min + _extra;
while {_i > 0} do {
	_soldier = _grp createUnit [(selectRandom fth_veh_supports_pat_classes),(getMarkerPos _spt_mkr),[],0,"NONE"];
	_soldier setSkill fth_side_res_skill;
	[_soldier] join _grp;
	_i = _i - 1;
	sleep 0.1;
};

// Further configure group:
_grp setBehaviour "SAFE";
_grp setCombatMode "GREEN";
_grp setSpeedMode "LIMITED";

// Create the patrol waypoints:
null = [_grp,(getMarkerPos _spt_mkr),fth_veh_supports_pat_gaps] call BIS_fnc_taskPatrol;

// Create a marker for the group and ensure it is updated as the vehicle moves:
_grp_mkrName = format ["pat_%1",_spt_mkr];
_grp_mkr = createMarker [_grp_mkrName, getMarkerPos _spt_mkr];
_grp_mkrName setMarkerType "n_inf";
_grp_mkrName setMarkerAlpha 0;
_grp_mkrName setMarkerColor "colorGreen";
fth_veh_supports_pat_mkrs = fth_veh_supports_pat_mkrs + [[_grp_mkr,_grp]];