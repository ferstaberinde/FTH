// OBJECT - INIT
// =============

// Create the object vehicle: 
fth_veh_object = fth_veh_object_class createVehicle getMarkerPos fth_veh_object_mkr;
fth_veh_object setDir (markerDir fth_veh_object_mkr);

// Ensure the marker is updated as the vehicle moves:
fth_mkrs_local = fth_mkrs_local + [[fth_veh_object_mkr,fth_veh_object]];

// Add inspection action
[[fth_veh_object, ["Inspect",{hint "MISSION UPDATE\nThis is the target vehicle!";},nil,0,true,false,"","",10]],"addAction",true,true] call BIS_fnc_MP;

// Create a group for the crew of the object vehicle:
fth_grp_object_crew = createGroup resistance;

// Create driver and place in the vehicle:
fth_man_object_driver = fth_grp_object_crew createUnit [fth_veh_object_crew_class,[0,0],[],0,"NONE"];
fth_man_object_driver setSkill fth_side_res_skill;
[fth_man_object_driver] join fth_grp_object_crew;
fth_man_object_driver assignAsDriver fth_veh_object;
fth_man_object_driver moveInDriver fth_veh_object;

// Create guard and place in the vehicle:
fth_man_object_guard = fth_grp_object_crew createUnit [fth_veh_object_crew_class,[0,0],[],0,"NONE"];
fth_man_object_guard setSkill fth_side_res_skill;
[fth_man_object_guard] join fth_grp_object_crew;
fth_man_object_guard assignAsCargo fth_veh_object;
fth_man_object_guard moveInCargo fth_veh_object;

// Initiate the object movement script
_nul = [fth_grp_object_crew,""] execVM "fth\object\movement.sqf";