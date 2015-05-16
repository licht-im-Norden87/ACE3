/*
 * Author: Glowbal
 * Module for adjusting the medical revive settings
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_logic", "_units", "_activated"];
_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {};

[_logic, QGVAR(maxReviveTime), "maxReviveTime"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(amountOfReviveLives), "amountOfReviveLives"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(enableRevive), "enableRevive"] call EFUNC(common,readSettingFromModule);
