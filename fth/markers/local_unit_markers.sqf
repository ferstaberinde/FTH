// MARKERS - LOCAL UNIT MARKERS
// ============================

// Declare local variables:
private ["_side","_units","_i","_mkr","_mkrName","_color","_mkrs","_refresh"];

// Populate some local variable using variables passed to the script:
_side = _this select 0;
_color = _this select 1;
_refresh = _this select 2;
_units = [];
_mkrs = [];

// Create the array of units to track:
switch (_side) do { 
	case "west" : {{_units = _units + (units _x);} forEach fth_grps_blu_inf;};
	case "east" : {{_units = _units + (units _x);} forEach fth_grps_opf_inf;};
};

// Pause (this is especially for when this script is controlling enemy unit markers):
sleep (_refresh * 2);

// Set up the markers
_i = 0;
{
	_mkrName = format ["%1_unit_%2",_side,_i];
	_mkr = createMarkerLocal [_mkrName, position _x];
	_mkrName setMarkerTypeLocal "mil_dot";
	_mkrName setMarkerColorLocal _color;
	_mkrs = _mkrs + [[_mkrName,_x]];
	_i = _i + 1;
} forEach _units;

// Update the position of all markers every N seconds (value passed to the script):
while {true} do {

	// Declare local variables:
	private ["_entity_mkr","_entity"];

	{
		_entity_mkr = _x select 0;
		_entity = _x select 1;
		_entity_mkr setMarkerPosLocal (getPosATL _entity);
	} forEach _mkrs;

	sleep _refresh;

};