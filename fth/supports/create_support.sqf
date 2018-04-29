// SUPPORTS - CREATE DECOY
// =======================

// Declare local variables:
private ["_spt_mkr","_type","_veh_type","_veh","_text"];

// Populate some local variables using values passed to the script:
_spt_mkr = _this select 0;
_type = _this select 1;

// Create the support vehicle:
switch (_type) do { 
	case "F" : { _veh_type = fth_veh_supports_fuel_class }; 
	case "R" : { _veh_type = fth_veh_supports_repair_class };
};
_veh = _veh_type createVehicle getMarkerPos _spt_mkr;
_veh setDir (markerDir _spt_mkr);	

// Update the label of the marker (globally) to indicate the type of vehicle:
_text = format ["%1 %2",(markerText _spt_mkr),_type];
_spt_mkr setMarkerText _text;

// Create patrol around the vehicle:
null = [_spt_mkr] execVM "fth\resistance\create_patrol.sqf";