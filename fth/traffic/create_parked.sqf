// TRAFFIC - CREATE PARKED VEHICLES
// ================================

// Declare local variables:
private ["_mkr","_veh"];

// Populate some local variables using values passed to the script:
_mkr = _this select 0;

// Create the vehicle:
_veh = (selectRandom fth_veh_civ_classes) createVehicle getMarkerPos _mkr;
_veh setDir (markerDir _mkr);

// Add unflip action
[[_veh, ["Unflip Vehicle","fth\object\unflip.sqf",nil,0,true,false,"","",10]],"addAction",true,true] call BIS_fnc_MP;

// Ensure the marker position is updated if the vehicle moves:
fth_mkrs_local = fth_mkrs_local + [[_mkr,_veh]];
_mkr setMarkerAlpha 0; // Hide marker globally (it will be un-hidden by local markers script)