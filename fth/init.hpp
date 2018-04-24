// FER'S TREASURE HUNT MASTER INIT
// ===============================

// This sleep ensures the set-up of the mission occurs at the appropriate time.
sleep 1;

/* SERVER INITS
These inits are ONLY run on the server.

| INIT               | DESCRIPTION
|====================|============       
| _init_resistance   | Initialises Resistance (Independent) side
| _init_object       | Initialise object vehicle and crew
| _init_decoys       | Initialises the decoy vehicles
| _init_supports     | Initialises the support vehicles
| _init_players      | Initialises the player units and vehicles

*/

if (isServer) then {

	_init_resistance = execVM "fth\resistance\init.sqf";
	_init_object = execVM "fth\object\init.sqf";
	_init_decoys = execVM "fth\decoys\init.sqf";
	_init_supports = execVM "fth\supports\init.sqf";
	_init_players = execVM "fth\players\init.sqf";

};

/* GLOBAL INITS
These inits are run on all machines.

| INIT               | DESCRIPTION
|====================|============ 
| _init_markers      | Initialises markers system

*/

_init_markers = execVM "fth\markers\init.sqf";
// TODO: Initiate friendly markers.
// TODO: Initiate enemy intel markers