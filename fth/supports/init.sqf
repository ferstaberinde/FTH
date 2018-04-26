// SUPPORTS - INIT
// ===============

// Declare local variables:
private ["_i","_mkr","_supports"];

// Check that the number of supports does not exceed available markers (and set to 1 per type if not):
if ((2 * fth_veh_supports_type_count) > count fth_veh_supports_mkrs) then {
	fth_veh_supports_type_count = 1;
};

// Pick markers for the fuel trucks and initiate the creation script for each:
_i = fth_veh_supports_type_count;
_supports = [];
while {_i > 0} do {
	_mkr = selectRandom fth_veh_supports_mkrs;
	_supports = _supports + [_mkr];
	fth_veh_supports_mkrs = fth_veh_supports_mkrs - [_mkr];
	_i = _i - 1;
};
{
  nul = [_x,"F"] execVM "fth\supports\create_support.sqf";
} forEach _supports;

// Pick markers for the repair trucks and initiate the creation script for each:
_i = fth_veh_supports_type_count;
_supports = [];
while {_i > 0} do {
	_mkr = selectRandom fth_veh_supports_mkrs;
	_supports = _supports + [_mkr];
	fth_veh_supports_mkrs = fth_veh_supports_mkrs - [_mkr];
	_i = _i - 1;
};
{
  nul = [_x,"R"] execVM "fth\supports\create_support.sqf";
} forEach _supports;

// Delete unused markers:
{
	[_x] remoteExec ["deleteMarkerLocal"];
} forEach fth_veh_supports_mkrs;