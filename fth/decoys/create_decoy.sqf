// DECOYS - CREATE DECOY
// =====================

// Declare local variables:
private ["_decoy_mkr","_veh","_grp","_driver","_guard"];

// Populate some local variable using variables in the master FTH config:
_decoy_mkr = _this select 0;

// Create the decoy vehicle (same type as the object vehicle):
_veh = fth_veh_decoys_class createVehicle getMarkerPos _decoy_mkr;
_veh setDir (markerDir _decoy_mkr);

// Ensure the marker is updated as the vehicle moves:
fth_mkrs_local = fth_mkrs_local + [[_decoy_mkr,_veh]];

// Add inspection action
[[_veh, ["Inspect",{hint "MISSION UPDATE\nThis is NOT the target vehicle!";},nil,0,true,false,"","",10]],"addAction",true,true] call BIS_fnc_MP;

// Create a group for the crew of the object vehicle:
_grp = createGroup resistance;

// Create driver and place in the vehicle:
_driver = _grp createUnit [fth_veh_object_crew_class,[0,0],[],0,"NONE"];
_driver setSkill fth_side_res_skill;
[_driver] join _grp;
_driver assignAsDriver _veh;
_driver moveInDriver _veh;

// Create guard and place in the vehicle:
_guard = _grp createUnit [fth_veh_object_crew_class,[0,0],[],0,"NONE"];
_guard setSkill fth_side_res_skill;
[_guard] join _grp;
_guard assignAsCargo _veh;
_guard moveInCargo _veh;

// Initiate the object movement script
_null = [_grp,""] execVM "fth\object\movement.sqf";