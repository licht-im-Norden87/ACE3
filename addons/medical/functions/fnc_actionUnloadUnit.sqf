/*
 * Author: Glowbal
 * Action for unloading an unconscious or dead unit from a vechile
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Drag after unload <BOOL> <OPTIONAL>
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_caller", "_target", "_drag"];
_caller = _this select 0;
_target = _this select 1;
_drag = if (count _this > 2) then {_this select 2} else {false};

// cannot unload a unit not in a vehicle.
if (vehicle _target == _target) exitwith {};
if (([_target] call cse_fnc_isAwake)) exitwith {};

if ([_target] call EFUNC(common,unloadPerson)) then {
    if (_drag) then {
        if ((vehicle _caller) == _caller) then {
            [[_caller, _target, true], QUOTE(DFUNC(actionDragUnit)), _caller, false] call EFUNC(common,execRemoteFnc); // TODO replace by event
        };
    };
};
