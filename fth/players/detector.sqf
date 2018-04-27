// PLAYERS - DETECTOR
// ==================

// Declare local variables:
private ["_position_Start","_position_End","_distance"];

// Begin the reading process - get the player's position at the start of the reading:
fth_dct_mkr setMarkerSizeLocal [0,0];
fth_dct_mkr setMarkerPosLocal [0,0];
hint "DETECTOR\nNew Reading ...";
_position_Start = position player;

// Pause for the reading time:
sleep fth_dct_time;

// End the reading process:
_position_End = position player;
if (((_position_Start select 0) != (_position_End select 0)) || ((_position_Start select 1) != (_position_End select 1))) exitWith {
	hint "DETECTOR\nReading Failed";
};
_distance = player distance fth_veh_object;
if (_distance < fth_dct_range) then {
	fth_dct_mkr setMarkerSizeLocal [_distance,_distance];
	fth_dct_mkr setMarkerPosLocal _position_End;
	hint "DETECTOR\nCheck Map";
	sleep fth_dct_fade;
	fth_dct_mkr setMarkerSizeLocal [0,0];
	fth_dct_mkr setMarkerPosLocal [0,0];
} else {
	hint "DETECTOR\nOut Of Range";
};