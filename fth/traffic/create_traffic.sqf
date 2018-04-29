// TRAFFIC - CREATE TRAFFIC
// ========================

// Declare local variables:
private ["_wp_mkr","_side","_veh_mkrName","_veh_mkr","_number","_veh","_grp","_driver","_gunner"];

// Populate some local variables using values passed to the script:
_wp_mkr = _this select 0;
_side = _this select 1;
_number = _this select 2;

// Create the vehicle:
switch (_side) do { 
	case "M" : {
		_veh = (selectRandom fth_veh_res_classes) createVehicle getMarkerPos _wp_mkr;
	}; 
	case "C" : {
		_veh = (selectRandom fth_veh_civ_classes) createVehicle getMarkerPos _wp_mkr;
	};
};

// Create the marker and ensure it is updated as the vehicle moves:
_veh_mkrName = format ["%1_%2",_side,_number];
_veh_mkr = createMarker [_veh_mkrName, getMarkerPos _wp_mkr];
_veh_mkrName setMarkerType "mil_triangle";
_veh_mkrName setMarkerText format ["%1 %2",_side,_number];
_veh_mkrName setMarkerAlpha 0;
switch (_side) do { 
	case "M" : {
		_veh_mkrName setMarkerColor "colorGreen";
	}; 
	case "C" : {
		_veh_mkrName setMarkerColor "colorBlack";
	};
};
fth_mkrs_local = fth_mkrs_local + [[_veh_mkr,_veh]];

// Create a group for the crew of the object vehicle:
switch (_side) do { 
	case "M" : {
		_grp = createGroup resistance;
	}; 
	case "C" : {
		_grp = createGroup civilian;
	};
};

// Create driver and place in the vehicle:
switch (_side) do { 
	case "M" : {
		_driver = _grp createUnit [(selectRandom fth_veh_res_crew_classes),[0,0],[],0,"NONE"];
	}; 
	case "C" : {
		_driver = _grp createUnit [(selectRandom fth_veh_civ_crew_classes),[0,0],[],0,"NONE"];
	};
};
_driver setSkill fth_side_res_skill;
[_driver] join _grp;
_driver assignAsDriver _veh;
_driver moveInDriver _veh;

// For resistance vehicles, create a gunner and place in the vehicle:
switch (_side) do { 
	case "M" : {
		_gunner = _grp createUnit [(selectRandom fth_veh_res_crew_classes),[0,0],[],0,"NONE"];
		_gunner setSkill fth_side_res_skill;
		[_gunner] join _grp;
		_gunner assignAsGunner _veh;
		_gunner moveInGunner _veh;
	}; 
};

// Initiate the object movement script
_null = [_grp,_wp_mkr] execVM "fth\object\movement.sqf";