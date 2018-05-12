// RESISTANCE - INIT
// =================

// Create Centre for Resistance (Independent) side; this is required to make new groups of AI on that side:
_ResistanceHQ = createCenter resistance;

// Create the camps and their patrols:
{
  nul = [_x] execVM "fth\resistance\create_camp.sqf";
} forEach fth_side_res_cp_mkrs;