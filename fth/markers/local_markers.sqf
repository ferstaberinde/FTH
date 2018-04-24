// MARKERS - LOCAL MARKERS
// =======================

// Check the local refresh interval is LESS than the public update interval (and set to half the latter if not): 
if (fth_mkrs_local_update >= fth_mkrs_public_update) then {
	fth_mkrs_local_update = (fth_mkrs_public_update / 2);
};

// Broadcast the server value of fth_mkrs_local at each public update interval:
while {true} do {

	if (isServer) then {
		publicVariable "fth_mkrs_local";
	};

	// Update the position of all markers added to fth_mkrs_local every N seconds (defined in FTH master config):
	while {true} do {

		// Declare local variables:
		private ["_mkr","_entity"];

		{
			_mkr = _x select 0;
			_entity = _x select 1;
			_mkr setMarkerPosLocal (getPosATL _entity);
			_mkr setMarkerDirLocal (direction _entity);
		} forEach fth_mkrs_local;

		sleep fth_mkrs_local_update;
	};

	sleep fth_mkrs_public_update;

};