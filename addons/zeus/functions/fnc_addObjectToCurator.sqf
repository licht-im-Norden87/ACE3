/*
 * Author: Glowbal
 * Adds an object to curator upon spawn
 *
 * Arguments:
 * Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

if (!isServer) exitwith {};

params ["_object"];

if (!(_object getvariable [QGVAR(addObject), GVAR(autoAddObjects)])) exitwith {};

{
    _x addCuratorEditableObjects [[_object], true];
}foreach allCurators;
