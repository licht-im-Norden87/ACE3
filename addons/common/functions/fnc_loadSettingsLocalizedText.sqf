/*
 * Author: Glowbal
 * Parse all settings and load the localized displayName and description for all text
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_parseConfigForDisplayNames", "_name"];

_parseConfigForDisplayNames = {
    private "_optionEntry";
    _optionEntry = _this select 0;
    if !(isClass _optionEntry) exitwith {false};
    _x set [3, getText (_optionEntry >> "displayName")];
    _x set [4, getText (_optionEntry >> "description")];

    private "_values";
    _values = _x select 5;
    {
        private "_text";
        _text = _x;
        if (((typeName _text) == "STRING") && {(count _text) > 1} && {(_text select [0,1]) == "$"}) then {
            _text = localize (_text select [1, ((count _text) - 1)]); //chop off the leading $
            _values set [_forEachIndex, _text];
        };
    } forEach _values;
    true;
};


// Iterate through settings
{
    _name = _x select 0;

    if !([configFile >> "ACE_Settings" >> _name] call _parseConfigForDisplayNames) then {
        if !([configFile >> "ACE_ServerSettings" >> _name] call _parseConfigForDisplayNames) then {
            [missionConfigFile >> "ACE_Settings" >> _name] call _parseConfigForDisplayNames;
        };
    };

} forEach GVAR(settings);
