// PLAYERS - INIT
// ==============

// TODO: Evolve the code so it doesn't throw error messages due to empty groups etc.

// Declare local variables:
private ["_mkr"];

// Create and configure the BLUFOR helicopter:
_mkr = selectRandom fth_veh_th_blu_mkrs;
fth_veh_th_blu_mkrs = fth_veh_th_blu_mkrs - [_mkr];
fth_veh_th_blu = fth_veh_th_blu_class createVehicle getMarkerPos _mkr;
fth_veh_th_blu setDir (markerDir _mkr);
fth_veh_th_blu setDamage 0.75;
fth_veh_th_blu setFuel 0;

// Move in the BLUFOR helicopter's crew and passengers:
((units fth_grps_blu_th) select 0) moveInDriver fth_veh_th_blu;
((units fth_grps_blu_th) select 1) moveInCargo fth_veh_th_blu;
{{_x moveInCargo fth_veh_th_blu} forEach (units _x);} forEach fth_grps_blu_inf;

// Create and configure the OPFOR helicopter:
_mkr = selectRandom fth_veh_th_opf_mkrs;
fth_veh_th_opf_mkrs = fth_veh_th_opf_mkrs - [_mkr];
fth_veh_th_opf = fth_veh_th_opf_class createVehicle getMarkerPos _mkr;
fth_veh_th_opf setDir (markerDir _mkr);
fth_veh_th_opf setDamage 0.75;
fth_veh_th_opf setFuel 0;

// Move in the OPFOR helicopter's crew and passengers:
((units fth_grps_opf_th) select 0) moveInDriver fth_veh_th_opf;
((units fth_grps_opf_th) select 1) moveInCargo fth_veh_th_opf;
{{_x moveInCargo fth_veh_th_opf} forEach (units _x);} forEach fth_grps_opf_inf;

// Delete unused markers:
{
	deleteMarker _x;
} forEach fth_veh_th_blu_mkrs;
{
	deleteMarker _x;
} forEach fth_veh_th_opf_mkrs;