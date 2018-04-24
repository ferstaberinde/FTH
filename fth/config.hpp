// FER'S TREASURE HUNT MASTER CONFIG
// =================================

/* MARKERS
A dynamic markers system is implemented in full for admins, and in restricted form for players.

| VARIABLE               | DESCRIPTION
|========================|============          
| fth_mkrs_local         | Empty arrary that will be populated and used by the markers system (DO NOT EDIT)  
| fth_mkrs_admin_sides   | Sides that can see the admin markers (usually just "resistance")
| fth_mkrs_delay         | Time (in seconds) before the markers system starts working
| fth_mkrs_public_update | Time (in seconds) between each public broadcast of fth_mkrs_local by the server
| fth_mkrs_local_update  | Time (in seconds) between each refresh of local markers (must be LESS than fth_mkrs_public_update)

*/

fth_mkrs_local = []; // DO NOT EDIT
fth_mkrs_admin_sides = [west,resistance,east];
fth_mkrs_delay = 10;
fth_mkrs_public_update = 60;
fth_mkrs_local_update = 10;

/* RESISTANCE
The Resistance (Independent) is the AI-controlled side all player teams are fighting.

| VARIABLE             | DESCRIPTION
|======================|============          
| fth_side_res_skill   | Default skill for units on the Resistance (Independent) side

*/

fth_side_res_skill = 0.5;

/* OBJECT
The object is the vehicle all player teams are trying to capture.

| VARIABLE                  | DESCRIPTION
|===========================|============          
| fth_veh_object_mkr        | Name of the marker where the object vehicle spawns
| fth_veh_object_class      | Class of vehicle used for the object vehicle
| fth_veh_object_crew_class | Class of crew used for the object vehicle
| fth_veh_object_wp_mkrs    | Array of markers used for the object vehicle's movement waypoints
| fth_veh_object_wp_max_rad | Maximum completion radius (in meters) for the object vehicle's movement waypoints
| fth_veh_object_wp_timeout | Timeout values (in seconds) of the object vehicle's movement waypoints

*/

fth_veh_object_mkr = "fth_mkr_veh_object";
fth_veh_object_class = "I_Truck_02_covered_F";
fth_veh_object_crew_class = "I_Soldier_lite_F";
fth_veh_object_wp_mkrs = ["fth_mkr_wp_0","fth_mkr_wp_1","fth_mkr_wp_2","fth_mkr_wp_3"];
fth_veh_object_wp_max_rad = 100;
fth_veh_object_wp_timeout = [5,10,15];

/* DECOYS
The decoys look and behave exactly like the object vehicle.

| VARIABLE            | DESCRIPTION
|=====================|============          
| fth_veh_decoys_mkrs | Names of the markers where each decoy spawns (1 per marker listed)

*/

fth_veh_decoys_mkrs = ["fth_mkr_dcy_0","fth_mkr_dcy_1","fth_mkr_dcy_2","fth_mkr_dcy_3"];

/* SUPPORT VEHICLES
The support vehicles are parked fuel and repair trucks that the players must obtain to fix their helicopter.

| VARIABLE                      | DESCRIPTION
|===============================|============
| fth_veh_supports_fuel_class   | Class of vehicle used for the fuel support vehicle
| fth_veh_supports_repair_class | Class of vehicle used for the repair support vehicle
| fth_veh_supports_mkrs         | Names of the markers where support vehicle may spawn
| fth_veh_supports_type_count   | Number of support vehicles per type (fuel and repair)

*/

fth_veh_supports_fuel_class = "I_Truck_02_fuel_F";
fth_veh_supports_repair_class = "I_Truck_02_box_F";
fth_veh_supports_mkrs = ["fth_mkr_spt_0","fth_mkr_spt_1","fth_mkr_spt_2","fth_mkr_spt_3","fth_mkr_spt_4","fth_mkr_spt_5"];
fth_veh_supports_type_count = 2;