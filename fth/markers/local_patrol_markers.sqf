// MARKERS - LOCAL PATROL MARKERS
// ==============================

// Update the position of all markers added to fth_mkrs_local every N seconds (defined in FTH master config):
while {true} do {

	// Declare local variables:
	private ["_mkr","_grp"];

	{
		_mkr = _x select 0;
		_grp = _x select 1;
		if (alive leader _grp) then {
			_mkr setMarkerAlphaLocal 1;
			_mkr setMarkerPosLocal (getPosATL (leader _grp));
		};
	} forEach fth_veh_supports_pat_mkrs;

	sleep fth_mkrs_local_delay;
};