// FER'S TREASURE HUNT MASTER INIT
// ===============================

/* PAUSE BEFORE SET-UP STARTS
This sleep ensures the rest of the set-up of the mission occurs at the appropriate time.

*/

sleep 1;

/* SERVER INITS
These inits are ONLY run on the server.

| INIT               | DESCRIPTION
|====================|============       
| _init_resistance   | Initialises Resistance (Independent) side
| _init_object       | Initialise object vehicle and crew
| _init_decoys       | Initialises the decoy vehicles
| _init_supports     | Initialises the support vehicles
| _init_traffic      | Initialises the military and civlian vehicle traffic 
| _init_players      | Initialises the player units and vehicles
| _init_victory      | Initialises the victory conditions monitor(s)

*/

if (isServer) then {

	_init_resistance = execVM "fth\resistance\init.sqf";
	_init_object = execVM "fth\object\init.sqf";
	_init_decoys = execVM "fth\decoys\init.sqf";
	_init_supports = execVM "fth\supports\init.sqf";
	_init_traffic = execVM "fth\traffic\init.sqf";
	_init_players = execVM "fth\players\init.sqf";
	_init_victory = execVM "fth\victory\init.sqf";

};

/* GLOBAL INITS
These inits are run on all machines.

| INIT               | DESCRIPTION
|====================|============ 
| _init_markers      | Initialises markers system
| _init_player       | Initiates player-specific (locally-driven) settings

*/

_init_markers = execVM "fth\markers\init.sqf";
_init_player = execVM "fth\players\player.sqf";