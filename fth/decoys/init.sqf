// DECOYS - INIT
// =============

// Begin creating decoys:
{
  nul = [_x] execVM "fth\decoys\create_decoy.sqf";
} forEach fth_veh_decoys_mkrs;