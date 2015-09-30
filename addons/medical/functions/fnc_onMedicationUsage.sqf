/*
 * Author: Glowbal
 * Handles the medication given to a patient.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Medication Treatment classname <STRING>
 * 2: The medication treatment variablename <STRING>
 * 3: Max dosage <NUMBER>
 * 4: The ACE_time in the system <NUMBER>
 * 5: Incompatable medication <ARRAY<STRING>>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_foundEntry", "_allUsedMedication","_allMedsFromClassname", "_usedMeds", "_hasOverDosed", "_med", "_limit", "_decreaseAmount", "_viscosityAdjustment", "_medicationConfig", "_onOverDose"];
params ["_target", "_className", "_variable", "_maxDosage", "_timeInSystem", "_incompatabileMeds", "_viscosityChange", "_painReduce"];

_foundEntry = false;
_allUsedMedication = _target getvariable [QGVAR(allUsedMedication), []];
{
    _x params ["_variableX", "_allMedsFromClassname"];
    if (_variableX== _variable) exitwith {
        if !(_className in _allMedsFromClassname) then {
            _allMedsFromClassname pushback _className;
            _x set [1, _allMedsFromClassname];
            _allUsedMedication set [_foreachIndex, _x];
            _target setvariable [QGVAR(allUsedMedication), _allUsedMedication];
        };
        _foundEntry = true;
    };
} foreach _allUsedMedication;

if (!_foundEntry) then {
    _allUsedMedication pushback [_variable, [_className]];
    _target setvariable [QGVAR(allUsedMedication), _allUsedMedication];
};


_usedMeds = _target getvariable [_variable, 0];
if (_usedMeds >= floor (_maxDosage + round(random(2))) && _maxDosage >= 1 && GVAR(enableOverdosing)) then {
    [_target] call FUNC(setDead);
};

_hasOverDosed = 0;
{
    _x params ["_med", "_limit"];
    {
        _x params ["", "_classNamesUsed"];
        if ({_x == _med} count _classNamesUsed > _limit) then {
            _hasOverDosed = _hasOverDosed + 1;
        };
    } foreach _allUsedMedication;
} foreach _incompatabileMeds;

if (_hasOverDosed > 0 && GVAR(enableOverdosing)) then {
    _medicationConfig = (configFile >> "ACE_Medical_Advanced" >> "Treatment" >> "Medication");
    _onOverDose = getText (_medicationConfig >> "onOverDose");
    if (isClass (_medicationConfig >> _className)) then {
        _medicationConfig = (_medicationConfig >> _className);
         if (isText (_medicationConfig  >> "onOverDose")) then { _onOverDose = getText (_medicationConfig >> "onOverDose"); };
    };
    if (isNil _onOverDose) then {
        _onOverDose = compile _onOverDose;
    } else {
        _onOverDose = missionNamespace getvariable _onOverDose;
    };
    [_target, _className] call _onOverDose;
};

_decreaseAmount = 1 / _timeInSystem;
_viscosityAdjustment = _viscosityChange / _timeInSystem;

[{
    params ["_args", "_idPFH"];
    _args params ["_target", "_timeInSystem", "_variable", "_amountDecreased","_decreaseAmount", "_viscosityAdjustment", "_painReduce"];
    private "_usedMeds";
    _usedMeds = _target getvariable [_variable, 0];
    _usedMeds = _usedMeds - _decreaseAmount;
    _target setvariable [_variable, _usedMeds];

    _amountDecreased = _amountDecreased + _decreaseAmount;

    // Restoring the viscosity while the medication is leaving the system
    _target setvariable [QGVAR(peripheralResistance), ((_target getvariable [QGVAR(peripheralResistance), 100]) - _viscosityAdjustment) max 0];
    _target setvariable [QGVAR(painSuppress), ((_target getvariable [QGVAR(painSuppress), 0]) - _painReduce) max 0];

    if (_amountDecreased >= 1 || (_usedMeds <= 0) || !alive _target) then {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };
    _args set [3, _amountDecreased];
}, 1, [_target, _timeInSystem, _variable, 0, _decreaseAmount, _viscosityAdjustment, _painReduce / _timeInSystem] ] call CBA_fnc_addPerFrameHandler;
