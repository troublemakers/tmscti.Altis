execVM "R3F_LOG\init.sqf";
_igiload = execVM "IgiLoad\IgiLoadInit.sqf";
execVM "tmscti\gui\defines_idcs.sqf";

call compile preprocessFileLineNumbers "tmscti\supply_definitions.sqf";

spawnpositionwest = 0;

tms_init_base_container = compile preprocessFileLineNumbers "tmscti\init_base_container.sqf";

if(isServer) then {

    _starttruck1west = createVehicle ["B_Truck_01_transport_F", getMarkerPos "respawn_west", [], 0, "NONE"];
    _starttruck1west setVariable ["side", west, true];
    _hq_container_west = createVehicle ["Land_Cargo20_military_green_F", [getMarkerPos "respawn_west", 10, 90]  call BIS_fnc_relPos, [], 0, "NONE"];
    _hq_container_west setVariable ["side", west, true];
    [_hq_container_west, "Established HQ", "M1130_HQ_unfolded_Base_EP1"] call tms_init_base_container;

    victory_position = 0; // If this reaches 100, side west wins. If this reaches -100, side east wins
    victory_locations = []; // A list of all locations that generate victory points when owned by a side. Will be populated by the "init" parameter of those objects themselves.
	mission_ended = false;

    [] execVM "tmscti\periodically_update_score.sqf";
};
