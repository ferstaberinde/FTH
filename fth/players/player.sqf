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
					null = ["east","colorRed",fth_mkrs_local_delay] execVM "fth\markers\local_unit_markers.sqf";
					null = ["west","colorBlue",fth_mkrs_enemy_local_delay] execVM "fth\markers\local_unit_markers.sqf";
				};
	case resistance : {
					null = ["east","colorRed",fth_mkrs_local_delay] execVM "fth\markers\local_unit_markers.sqf";
					null = ["west","colorBlue",fth_mkrs_local_delay] execVM "fth\markers\local_unit_markers.sqf";
				}; 
};

// Return the map to players:
player addItem "itemMap";
player assignItem "itemMap";