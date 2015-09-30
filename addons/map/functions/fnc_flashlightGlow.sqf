/*
 * Author: voiper
 * Add or remove global flashlight glow for when player is looking at map.
 *
 * Arguments:
 * 0: Flashlight classname ("" for off) <STRING>
 *
 * Return value:
 * None
 *
 * Example:
 * ["ACE_Flashlight_MX991"] call ace_map_fnc_flashlightGlow;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_flashlight"];

_light = GVAR(glow);
if (!isNull _light) then {deleteVehicle _light};

if (_flashlight != "") then {
    _colour = getText (configFile >> "CfgWeapons" >> _flashlight >> "ItemInfo" >> "FlashLight" >> "ACE_Flashlight_Colour");
    if !(_colour in ["white", "red", "green", "blue", "yellow"]) then {_colour = "white"};
    _class = format["ACE_FlashlightProxy_%1", _colour];

    _light = _class createVehicle [0,0,0];
    _light attachTo [ACE_player, [0,0.5,-0.1], "head"];
} else {
    _light = objNull;
};

GVAR(glow) = _light;