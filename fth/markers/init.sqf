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

	// Hides the markers used to place the player's helicopters
	{_x setMarkerAlphaLocal 0} forEach fth_veh_th_blu_mkrs;
	{_x setMarkerAlphaLocal 0} forEach fth_veh_th_opf_mkrs;

	// Hides the markers used to place the parked vehicles
	{_x setMarkerAlphaLocal 0} forEach fth_veh_civ_pv_mkrs;

};

// Wait N seconds (defined in FTH master config) and then start broadcasting markers from server and start the local markers script for admins:
sleep fth_mkrs_delay;
if (isServer) then {
	null = [] execVM "fth\markers\broadcast_markers.sqf";
};
if (side player in fth_mkrs_admin_sides) then {
	null = [] execVM "fth\markers\local_markers.sqf";
	null = [] execVM "fth\markers\local_patrol_markers.sqf";
};