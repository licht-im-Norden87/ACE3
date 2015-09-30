/*
 * Author: Glowbal, Jonpas
 * Adds a cargo item to the vehicle.
 *
 * Arguments:
 * 0: Item Classname <STRING>
 * 1: Vehicle <OBJECT>
 * 2: Amount <NUMBER> (default: 1)
 * 3: Show Hint <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["item", vehicle] call ace_cargo_fnc_addCargoItem
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_position", "_item", "_i"];
params ["_itemClass", "_vehicle", ["_amount", 1], ["_showHint", false, [false]] ];
TRACE_3("params",_itemClass,_vehicle,_amount);

_position = getPos _vehicle;
_position set [1, (_position select 1) + 1];
_position set [2, (_position select 2) + 7.5];

for "_i" from 1 to _amount do {
    _item = createVehicle [_itemClass, _position, [], 0, "CAN_COLLIDE"];

    // Load item or delete it if no space left
    if !([_item, _vehicle, _showHint] call FUNC(loadItem)) exitWith {
        TRACE_1("no room to load item - deleting",_item);
        deleteVehicle _item;
    };
    TRACE_1("Item Loaded",_item);

    // Invoke listenable event
    ["cargoAddedByClass", [_itemClass, _vehicle, _amount]] call EFUNC(common,globalEvent);
};
