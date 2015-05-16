/*
 * Author: Glowbal
 * Handling of the open wounds & injuries upon the handleDamage eventhandler.
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Name Of Hit Selection <STRING>
 * 2: Amount Of Damage <NUMBER>
 * 3: Shooter or source of the damage <OBJECT>
 * 4: Type of the damage done <STRING>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_unit", "_selectionName", "_damage", "_typeOfProjectile", "_typeOfDamage", "_bodyPartn", "_injuryTypeInfo", "_allInjuriesForDamageType", "_allPossibleInjuries", "_highestPossibleDamage", "_highestPossibleSpot", "_minDamage", "_openWounds", "_woundID", "_toAddInjury", "_painToAdd", "_bloodLoss", "_bodyPartNToAdd", "_classType", "_damageLevels", "_foundIndex", "_i", "_injury", "_maxDamage", "_pain", "_painLevel", "_selections", "_toAddClassID", "_woundsCreated"];
_unit = _this select 0;
_selectionName = _this select 1;
_damage = _this select 2;
_typeOfProjectile = _this select 3;
_typeOfDamage = _this select 4;

// Convert the selectionName to a number and ensure it is a valid selection.
_bodyPartn = [_selectionName] call FUNC(selectionNameToNumber);
if (_bodyPartn < 0) exitwith {};

// Get the injury type information. Format: [typeDamage thresholds, selectionSpecific, woundTypes]
_injuryTypeInfo = missionNamespace getvariable [format[QGVAR(woundInjuryType_%1), _typeOfDamage],[[], false, []]];

// This are the available injuries for this damage type. Format [[classtype, selections, bloodloss, minimalDamage, pain], ..]
_allInjuriesForDamageType = _injuryTypeInfo select 2;
// It appears we are dealing with an unknown type of damage.

if (count _allInjuriesForDamageType == 0) then {
    // grabbing the configuration for unknown damage type
    _injuryTypeInfo = missionNamespace getvariable [QGVAR(woundInjuryType_unknown),[[], false, []]];
    _allInjuriesForDamageType = _injuryTypeInfo select 2;
};

// find the available injuries for this damage type and damage amount
_highestPossibleSpot = -1;
_highestPossibleDamage = -1;
_allPossibleInjuries = [];
{
    _damageLevels = _x select 4;
    _minDamage = _damageLevels select 0;
    _maxDamage = _damageLevels select 1;

    // Check if the damage is higher as the min damage for the specific injury
    if (_damage >= _minDamage && {_damage <= _maxDamage || _maxDamage < 0}) then {
        //_classType = _x select 0;
        _selections = _x select 1;
        //_bloodLoss = _x select 2;
        //_pain = _x select 3;

        // Check if the injury can be applied to the given selection name
        if ("All" in _selections || _selectionName in _selections) then {

            // Find the wound which has the highest minimal damage, so we can use this later on for adding the correct injuries
            if (_minDamage > _highestPossibleDamage) then {
                _highestPossibleSpot = _foreachIndex;
                _highestPossibleDamage = _minDamage;
            };

            // Store the valid possible injury for the damage type, damage amount and selection
            _allPossibleInjuries pushback _x;
        };
    };
}foreach _allInjuriesForDamageType;

// No possible wounds available for this damage type or damage amount.
if (_highestPossibleSpot < 0) exitwith {};

// Administration for open wounds and ids
_openWounds = _unit getvariable[QGVAR(openWounds), []];
_woundID = _unit getvariable[QGVAR(lastUniqueWoundID), 1];

_painToAdd = 0;
_woundsCreated = [];
{
    if (_x select 0 <= _damage) exitwith {
        for "_i" from 0 to (1+ floor(random(_x select 1)-1)) /* step +1 */ do {

            // Find the injury we are going to add. Format [ classID, allowdSelections, bloodloss, painOfInjury, minimalDamage]
            _toAddInjury =  if (random(1) >= 0.85) then {_allInjuriesForDamageType select _highestPossibleSpot} else {_allPossibleInjuries select (floor(random (count _allPossibleInjuries)));};
            _toAddClassID = _toAddInjury select 0;
            _foundIndex = -1;

            _bodyPartNToAdd = if (_injuryTypeInfo select 1) then {_bodyPartn} else {floor(random(6))};
            // If the injury type is selection part specific, we will check if one of those injury types already exists and find the spot for it..
            if ((_injuryTypeInfo select 1)) then {
                {
                    // Check if we have an id of the given class on the given bodypart already
                    if (_x select 1 == _toAddClassID && {_x select 2 == _bodyPartNToAdd}) exitwith {
                        _foundIndex = _foreachIndex;
                    };
                }foreach _openWounds;
            };

            _injury = [];
            if (_foundIndex < 0) then {
                // Create a new injury. Format [ID, classID, bodypart, percentage treated, bloodloss rate]
                _injury = [_woundID, _toAddInjury select 0, _bodyPartNToAdd, 1, _toAddInjury select 2];

                // Since it is a new injury, we will have to add it to the open wounds array to store it
                _openWounds pushback _injury;

                // New injuries will also increase the wound ID
                _woundID = _woundID + 1;
            } else {
                // We already have one of these, so we are just going to increase the number that we have of it with a new one.
                _injury = _openWounds select _foundIndex;
                _injury set [3, (_injury select 3) + 1];
            };
            // Store the injury so we can process it later correctly.
            _woundsCreated pushback _injury;

            // Collect the pain that is caused by this injury
            _painToAdd = _painToAdd + (_toAddInjury select 3);
        };
    };
}foreach (_injuryTypeInfo select 0); // foreach damage thresholds

_unit setvariable [QGVAR(openWounds), _openWounds, !USE_WOUND_EVENT_SYNC];

// Only update if new wounds have been created
if (count _woundsCreated > 0) then {
    _unit setvariable [QGVAR(lastUniqueWoundID), _woundID, true];
};

if (USE_WOUND_EVENT_SYNC) then {
    // Broadcast the new injuries across the net in parts. One broadcast per injury. Prevents having to broadcast one massive array of injuries.
    {
        ["medical_propagateWound", [_unit, _x]] call EFUNC(common,globalEvent);
    }foreach _woundsCreated;
};

_painLevel = _unit getvariable [QGVAR(pain), 0];
_unit setvariable [QGVAR(pain), _painLevel + _painToAdd];
