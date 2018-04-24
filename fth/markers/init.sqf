// MARKERS - INIT
// ==============

// Hide set-up markers for non-admins:
if (!(side player in fth_mkrs_admin_sides)) then {

	// Hides the marker used to place the object vehicle
	fth_veh_object_mkr setMarkerAlphaLocal 0;

	// Hides the waypoint markers used by the object and decoy vehicles
	{_x setMarkerAlphaLocal 0} forEach fth_veh_object_wp_mkrs;
	
	// Hides the markers used to place the decoy vehicles
	{_x setMarkerAlphaLocal 0} forEach fth_veh_decoys_mkrs;

	// Hides the markers used to place the support vehicles
	{_x setMarkerAlphaLocal 0} forEach fth_veh_supports_mkrs;

};

// Wait N seconds (defined in FTH master config) and then start the local markers script for admins:
sleep fth_mkrs_delay;
if (side player in fth_mkrs_admin_sides) then {
	null = [] execVM "fth\markers\local_markers.sqf";
};