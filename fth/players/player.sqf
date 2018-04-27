// PLAYERS - PLAYER
// ================

// This sleep ensures that these set-up tasks occur at the appropriate time:
sleep 1;

// Create the appropriate local markers:
switch (side player) do { 
	case west : {
					null = ["west","colorBlue",fth_mkrs_local_delay] execVM "fth\markers\local_unit_markers.sqf";
					null = ["east","colorRed",fth_mkrs_enemy_local_delay] execVM "fth\markers\local_unit_markers.sqf";
				}; 
	case east : {
					null = ["east","colorBlue",fth_mkrs_local_delay] execVM "fth\markers\local_unit_markers.sqf";
					null = ["west","colorRed",fth_mkrs_enemy_local_delay] execVM "fth\markers\local_unit_markers.sqf";
				};
	case resistance : {
					null = ["east","colorRed",fth_mkrs_local_delay] execVM "fth\markers\local_unit_markers.sqf";
					null = ["west","colorBlue",fth_mkrs_local_delay] execVM "fth\markers\local_unit_markers.sqf";
				}; 
};

// Return the map to players:
player addItem "itemMap";
player assignItem "itemMap";

// Set up the player's detector:
fth_dct_mkr setMarkerSizeLocal [0,0];
fth_dct_mkr setMarkerPosLocal [0,0];
player addAction ["Take Reading","fth\players\detector.sqf"];