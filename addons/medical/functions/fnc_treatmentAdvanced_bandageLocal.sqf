/*
 * Author: Glowbal
 * Handles the bandage of a patient.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Treatment classname <STRING>
 *
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_target", "_bandage", "_part", "_selectionName", "_openWounds", "_config", "_effectiveness","_mostEffectiveInjury", "_mostEffectiveSpot", "_woundEffectivenss", "_mostEffectiveInjury", "_impact", "_exit", "_specificClass", "_classID", "_effectivenessFound", "_className", "_hitPoints", "_hitSelections", "_point", "_woundTreatmentConfig"];
_target = _this select 0;
_bandage = _this select 1;
_selectionName = _this select 2;
_specificClass = if (count _this > 3) then {_this select 3} else { -1 };

// Ensure it is a valid bodypart
_part = [_selectionName] call FUNC(selectionNameToNumber);
if (_part < 0) exitwith {};

// Get the open wounds for this unit
_openWounds = _target getvariable [QGVAR(openWounds), []];
if (count _openWounds == 0) exitwith {}; // nothing to do here!

// Get the default effectiveness for the used bandage
_config = (ConfigFile >> "ACE_Medical_Advanced" >> "Treatment" >> "Bandaging");
_effectiveness = getNumber (_config >> "effectiveness");
if (isClass (_config >> _bandage)) then {
    _config = (_config >> _bandage);
    if (isNumber (_config >> "effectiveness")) then { _effectiveness = getNumber (_config >> "effectiveness");};
};

// Figure out which injury for this bodypart is the best choice to bandage
_mostEffectiveSpot = 0;
_effectivenessFound = -1;
_mostEffectiveInjury = _openWounds select 0;
_exit = false;
{
    // Only parse injuries that are for the selected bodypart.
    if (_x select 2 == _part) then {
        _woundEffectivenss = _effectiveness;
        _classID = (_x select 1);

        // Select the classname from the wound classname storage
        _className = GVAR(woundClassNames) select _classID;
        // Check if this wound type has attributes specified for the used bandage
        if (isClass (_config >> _className)) then {
            // Collect the effectiveness from the used bandage for this wound type
            _woundTreatmentConfig = (_config >> _className);
            if (isNumber (_woundTreatmentConfig >> "effectiveness")) then {
                _woundEffectivenss = getNumber (_woundTreatmentConfig >> "effectiveness");
            };
        };

        if (_specificClass == _classID) exitwith {
            _effectivenessFound = _woundEffectivenss;
            _mostEffectiveSpot = _foreachIndex;
            _mostEffectiveInjury = _x;
            _exit = true;
        };

        // Check if this is the currently most effective found.
        if (_woundEffectivenss * ((_x select 4) * (_x select 3)) > _effectivenessFound * ((_mostEffectiveInjury select 4) * (_mostEffectiveInjury select 3))) then {
            _effectivenessFound = _woundEffectivenss;
            _mostEffectiveSpot = _foreachIndex;
            _mostEffectiveInjury = _x;
        };
    };
    if (_exit) exitwith {};
}foreach _openWounds;

if (_effectivenessFound == -1) exitwith {}; // Seems everything is patched up on this body part already..


// TODO refactor this part
// Find the impact this bandage has and reduce the amount this injury is present
_impact = if ((_mostEffectiveInjury select 3) >= _effectivenessFound) then {_effectivenessFound} else { (_mostEffectiveInjury select 3) };
_mostEffectiveInjury set [ 3, ((_mostEffectiveInjury select 3) - _impact) max 0];
_openWounds set [_mostEffectiveSpot, _mostEffectiveInjury];

_target setvariable [QGVAR(openWounds), _openWounds, !USE_WOUND_EVENT_SYNC];

if (USE_WOUND_EVENT_SYNC) then {
    ["medical_propagateWound", [_target, _mostEffectiveInjury]] call EFUNC(common,globalEvent);
};
// Handle the reopening of bandaged wounds
if (_impact > 0 && {GVAR(enableAdvancedWounds)}) then {
    [_target, _impact, _part, _mostEffectiveSpot, _mostEffectiveInjury, _bandage] call FUNC(handleBandageOpening);
};

// If all wounds have been bandaged, we will reset all damage to 0, so the unit is not showing any blood on the model anymore.
if (GVAR(healHitPointAfterAdvBandage) && {{(_x select 2) == _part && {_x select 3 > 0}}count _openWounds == 0}) then {
    _hitSelections = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];
    _hitPoints = ["HitHead", "HitBody", "HitLeftArm", "HitRightArm", "HitLeftLeg", "HitRightLeg"];
    _point = _hitPoints select (_hitSelections find _selectionName);
    [_target, _point, 0] call FUNC(setHitPointDamage);
    // _target setvariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0], true];
};

true;
