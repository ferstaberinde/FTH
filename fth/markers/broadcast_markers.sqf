// MARKERS - BROADCAST MARKERS
// ===========================

// At regular intervals the server will broadcast its array of markers for game marshalls to see as well:
while {true} do {
	publicVariable "fth_mkrs_local";
	publicVariable "fth_veh_supports_pat_grps";
	sleep fth_mkrs_public_update;
};