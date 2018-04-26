// PLAYERS - INIT
// ==============

// Declare local variables:
private ["_mkr"];

// Move and configure the BLUFOR helicopter:
_mkr = selectRandom fth_veh_th_blu_mkrs;
fth_veh_th_blu_mkrs = fth_veh_th_blu_mkrs - [_mkr];
fth_veh_th_blu setPos getMarkerPos _mkr;
fth_veh_th_blu setDir (markerDir _mkr);
fth_veh_th_blu setDamage 0.75;
fth_veh_th_blu setFuel 0;

// Move and configure the OPFOR helicopter:
_mkr = selectRandom fth_veh_th_opf_mkrs;
fth_veh_th_opf_mkrs = fth_veh_th_opf_mkrs - [_mkr];
fth_veh_th_opf setPos getMarkerPos _mkr;
fth_veh_th_opf setDir (markerDir _mkr);
fth_veh_th_opf setDamage 0.75;
fth_veh_th_opf setFuel 0;

// Delete unused markers:
{
	[_x] remoteExec ["deleteMarkerLocal"];
} forEach fth_veh_th_blu_mkrs;
{
	[_x] remoteExec ["deleteMarkerLocal"];
} forEach fth_veh_th_opf_mkrs;