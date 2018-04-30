// FER'S TREASURE HUNT MASTER CONFIG
// =================================

/* MARKERS
A dynamic markers system is implemented in full for admins, and in restricted form for players.

| VARIABLE                    | DESCRIPTION
|=============================|============          
| fth_mkrs_local              | Empty arrary that will be populated and used by the markers system (DO NOT EDIT)  
| fth_mkrs_admin_sides        | Sides that can see the admin markers (usually just "resistance")
| fth_mkrs_delay              | Time (in seconds) before the markers system starts working
| fth_mkrs_public_update      | Time (in seconds) between each public broadcast of fth_mkrs_local by the server
| fth_mkrs_local_delay        | Time (in seconds) between each refresh of local markers (must be LESS than fth_mkrs_public_update)
| fth_mkrs_enemy_local_delay  | Time (in seconds) between each refresh of local markers for ENEMY units (recommended at least 60)

*/

fth_mkrs_local = []; // DO NOT EDIT
fth_mkrs_admin_sides = [west,resistance,east];
fth_mkrs_delay = 10;
fth_mkrs_public_update = 60;
fth_mkrs_local_delay = 5;
fth_mkrs_enemy_local_delay = 60;

/* RESISTANCE
The Resistance (Independent) is the AI-controlled side all player teams are fighting.

| VARIABLE                      | DESCRIPTION
|===============================|============          
| fth_side_res_skill            | Default skill for units on the Resistance (Independent) side
| fth_veh_supports_pat_classes  | Class of troops used for the patrols around the support vehicles
| fth_veh_supports_pat_min      | Minimum number of troops in a patrol
| fth_veh_supports_pat_max      | Maximum number of troops in a patrol
| fth_veh_supports_pat_gaps     | Distance (in meters) between waypoints of each patrol
| fth_veh_supports_pat_mkrs     | Empty arrary that will be populated and used by the patrol groups system (DO NOT EDIT)

*/

fth_side_res_skill = 0.5;
fth_veh_supports_pat_classes = ["I_C_Soldier_Para_3_F","I_C_Soldier_Para_7_F","I_C_Soldier_Bandit_2_F","I_C_Soldier_Bandit_4_F"];
fth_veh_supports_pat_min = 2;
fth_veh_supports_pat_max = 5;
fth_veh_supports_pat_gaps = 150;
fth_veh_supports_pat_mkrs = []; // DO NOT EDIT

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
fth_veh_object_class = "C_Truck_02_covered_F";
fth_veh_object_crew_class = "I_C_Soldier_Para_3_F";
fth_veh_object_wp_mkrs = ["fth_mkr_wp_0","fth_mkr_wp_1","fth_mkr_wp_2","fth_mkr_wp_3"];
fth_veh_object_wp_max_rad = 300;
fth_veh_object_wp_timeout = [60,120,180];

/* DECOYS
The decoys look and behave exactly like the object vehicle.

| VARIABLE             | DESCRIPTION
|======================|============ 
| fth_veh_decoys_class | By default, set to the same value as fth_veh_object_class     
| fth_veh_decoys_mkrs  | Names of the markers where each decoy spawns (1 per marker listed)

*/

fth_veh_decoys_class = fth_veh_object_class;
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

fth_veh_supports_fuel_class = "C_Truck_02_fuel_F";
fth_veh_supports_repair_class = "C_Truck_02_box_F";
fth_veh_supports_mkrs = ["fth_mkr_spt_0","fth_mkr_spt_1","fth_mkr_spt_2","fth_mkr_spt_3","fth_mkr_spt_4","fth_mkr_spt_5"];
fth_veh_supports_type_count = 2;

/* TRAFFIC
Civilian vehicles that drive around the island. And get car-jacked by players.

| VARIABLE                 | DESCRIPTION
|==========================|============ 
| fth_veh_res_classes      | Classes of vehicles used for the resistance vehicles
| fth_veh_res_crew_classes | Class of crew used for the resistance vehicles
| fth_veh_civ_classes      | Classes of vehicles used for the civilian vehicles
| fth_veh_civ_crew_classes | Class of crew used for the civilian vehicles

*/

fth_veh_res_classes = ["I_C_Offroad_02_LMG_F","I_G_Offroad_01_armed_F"];
fth_veh_res_crew_classes = ["I_C_Soldier_Para_3_F","I_C_Soldier_Para_7_F","I_C_Soldier_Bandit_2_F","I_C_Soldier_Bandit_4_F"];
fth_veh_civ_classes = ["C_Offroad_01_F","C_SUV_01_F","C_Van_01_box_F","C_Offroad_02_unarmed_F","C_Hatchback_01_F","C_Truck_02_covered_F"];
fth_veh_civ_crew_classes = ["C_man_p_shorts_1_F","C_man_p_fugitive_F","C_man_polo_6_F","C_man_polo_5_F","C_man_polo_4_F","C_man_polo_1_F"];

/* PLAYERS
The groups, vehicle types and possible starting locations for players.

| VARIABLE             | DESCRIPTION
|======================|============ 
| fth_veh_th_blu_mkrs  | Names of the markers where the BLUFOR helicopter may spawn
| fth_veh_th_opf_mkrs  | Names of the markers where the OPFOR helicopter may spawn
| fth_grps_blu_inf     | The BLUFOR infantry groups
| fth_grps_opf_inf     | The OPFOR infantry groups

*/

fth_veh_th_blu_mkrs = ["fth_mkr_th_blu_0","fth_mkr_th_blu_1","fth_mkr_th_blu_2","fth_mkr_th_blu_3","fth_mkr_th_blu_4","fth_mkr_th_blu_5","fth_mkr_th_blu_6","fth_mkr_th_blu_7"];
fth_veh_th_opf_mkrs = ["fth_mkr_th_opf_0","fth_mkr_th_opf_1","fth_mkr_th_opf_2","fth_mkr_th_opf_3","fth_mkr_th_opf_4","fth_mkr_th_opf_5","fth_mkr_th_opf_6","fth_mkr_th_opf_7"];
fth_grps_blu_inf = [fth_grp_blu_asl,fth_grp_blu_a1,fth_grp_blu_a2,fth_grp_blu_a3];
fth_grps_opf_inf = [fth_grp_opf_asl,fth_grp_opf_a1,fth_grp_opf_a2,fth_grp_opf_a3];

/* DETECTOR
The effective distance and processing time for the detector that players use to locate the object vehicle.

| VARIABLE       | DESCRIPTION
|================|============ 
| fth_dct_mkr    | Name of the marker used (locally) to indicate the distance to the object vehicle
| fth_dct_range  | Maximum range (in metres) at which the object vehicle can be detected
| fth_dct_time   | Time (in seconds) required to take a reading
| fth_dct_fade   | Time (in seconds) before marker is reset on the player's map after a reading 

*/

fth_dct_mkr = "mkr_dct";
fth_dct_range = 2000;
fth_dct_time = 30;
fth_dct_fade = 120;

// END