// TRAFFIC - CREATE PARKED VEHICLES
// ================================

// Declare local variables:
private ["_mkr","_veh"];

// Populate some local variables using values passed to the script:
_mkr = _this select 0;

// Create the vehicle:
_veh = (selectRandom fth_veh_civ_classes) createVehicle getMarkerPos _mkr;
_veh setDir (markerDir _mkr);	