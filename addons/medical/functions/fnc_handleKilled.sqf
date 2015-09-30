/*
 * Author: Glowbal
 * Called when a unit is killed
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private "_openWounds";
params ["_unit"];
if (!local _unit) exitwith {};

_unit setvariable [QGVAR(pain), 0];
if (GVAR(level) >= 2) then {
    _unit setvariable [QGVAR(heartRate), 0];
    _unit setvariable [QGVAR(bloodPressure), [0, 0]];
    _unit setvariable [QGVAR(airwayStatus), 0];
};
