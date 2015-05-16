//XEH_clientInit.sqf
#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(ParsedTextCached) = [];

//Setup text/shadow/size/color settings matrix
[] call FUNC(setupTextColors);
["SettingChanged", {
    PARAMS_1(_name);
    if (_name in [QGVAR(colorTextMax), QGVAR(colorTextMin), QGVAR(colorShadowMax), QGVAR(colorShadowMin), QGVAR(textSize), QGVAR(shadowSetting)]) then {
        [] call FUNC(setupTextColors);
    };
}] call EFUNC(common,addEventhandler);

// Install the render EH on the main display
addMissionEventHandler ["Draw3D", DFUNC(render)];

// This spawn is probably worth keeping, as pfh don't work natively on the briefing screen and IDK how reliable the hack we implemented for them is.
// The thread dies as soon as the mission start, so it's not really compiting for scheduler space.
[] spawn {
    // Wait until the map display is detected
    waitUntil {(!isNull findDisplay 12)};

    // Install the render EH on the map screen
    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", DFUNC(render)];
};


["ACE3 Common", QGVAR(InteractKey), (localize "STR_ACE_Interact_Menu_InteractKey"),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside","isNotDragging", "isNotCarrying", "isNotSwimming", "notOnMap", "isNotEscorting", "isNotSurrendering"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Statement
    [0] call FUNC(keyDown)
},{[0,false] call FUNC(keyUp)},
[219, [false, false, false]], false] call cba_fnc_addKeybind;  //Left Windows Key

["ACE3 Common", QGVAR(SelfInteractKey), (localize "STR_ACE_Interact_Menu_SelfInteractKey"),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside","isNotDragging", "isNotCarrying", "isNotSwimming", "notOnMap", "isNotEscorting", "isNotSurrendering"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Statement
    [1] call FUNC(keyDown)
},{[1,false] call FUNC(keyUp)},
[219, [false, true, false]], false] call cba_fnc_addKeybind; //Left Windows Key + Ctrl/Strg


// Listens for the falling unconscious event, just in case the menu needs to be closed
["medical_onUnconscious", {
    // If no menu is open just quit
    if (GVAR(openedMenuType) < 0) exitWith {};

    EXPLODE_2_PVT(_this,_unit,_isUnconscious);

    if (_unit != ACE_player || !_isUnconscious) exitWith {};

    GVAR(actionSelected) = false;
    [GVAR(openedMenuType), false] call FUNC(keyUp);
}] call EFUNC(common,addEventhandler);

// disable firing while the interact menu is is is opened
["playerChanged", {_this call FUNC(handlePlayerChanged)}] call EFUNC(common,addEventHandler);
