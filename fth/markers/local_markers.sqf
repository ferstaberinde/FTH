// MARKERS - LOCAL MARKERS
// =======================

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