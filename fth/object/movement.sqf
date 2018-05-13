// OBJECT - MOVEMENT
// =================

// Declare local variables:
private ["_wp_mkrs","_grp","_current_wp","_combat_mode","_next_wp"];

// Populate some local variable using variables in the master FTH config:
_wp_mkrs = fth_veh_object_wp_mkrs;

// Popuate other local variables from arguments passed to this script:
_grp = _this select 0;
_current_wp = _this select 1;
_combat_mode = _this select 2;

// If the vehicle has just completed a waypoint, we remove that position from the array of possible waypoints:
if (_current_wp != "") then {
	_wp_mkrs = _wp_mkrs - [_current_wp];
};

// Select the next waypoint from the array of possible waypoints:
_next_wp_mkr = selectRandom _wp_mkrs;

/* 
Create the next waypoint and set it to be the current waypoint. The timeout values may differ depending on
whether the vehicle used by the group is the same type as the object vehicle (so the object itself or a decoy),
or another type of road traffic. when the waypoint completes, it will delete itself, then call this script
again, passing it the name of the group and the name of the marker just used.
*/
_next_wp = _grp addWaypoint [(getMarkerPos _next_wp_mkr),0];
_next_wp setWaypointBehaviour "SAFE";
switch (_combat_mode) do { 
	case "GREEN" : {
		_next_wp setWaypointCombatMode "GREEN";
	};
	case "RED" : {
		_next_wp setWaypointCombatMode "RED";
	}; 
};
_next_wp setWaypointCompletionRadius (random fth_veh_object_wp_max_rad);
_next_wp setWaypointSpeed "LIMITED";
_next_wp setWaypointStatements ["true",
    format["deleteWaypoint [group this, currentWaypoint (group this)]; nul = [(group this),'%1','%2'] execVM 'fth\object\movement.sqf';",_next_wp_mkr,_combat_mode]
];
if (typeOf vehicle leader _grp == fth_veh_object_class) then {
	_next_wp setWaypointTimeout fth_veh_object_wp_timeout;
} else {
	_next_wp setWaypointTimeout [1,5,10];
};
_next_wp setWaypointType "MOVE";
_grp setCurrentWaypoint _next_wp;