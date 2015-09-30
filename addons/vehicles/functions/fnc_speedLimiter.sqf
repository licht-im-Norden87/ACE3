/*
 * Author: commy2
 * Toggle speed limiter for Driver in Vehicle.
 *
 * Arguments:
 * 0: Driver <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, car] call ace_vehicles_fnc_speedLimiter
 *
 * Public: No
 */
#include "script_component.hpp"

private "_maxSpeed";

params ["_driver", "_vehicle"];

if (GETGVAR(isSpeedLimiter,false)) exitWith {
    [localize LSTRING(Off)] call EFUNC(common,displayTextStructured);
    playSound "ACE_Sound_Click";
    GVAR(isSpeedLimiter) = false;
};

[localize LSTRING(On)] call EFUNC(common,displayTextStructured);
playSound "ACE_Sound_Click";
GVAR(isSpeedLimiter) = true;

_maxSpeed = speed _vehicle max 10;

[{
    params ["_args", "_idPFH"];
    _args params ["_driver", "_vehicle", "_maxSpeed"];

    if (!GVAR(isSpeedLimiter) || {_driver != driver _vehicle}) exitWith {
        GVAR(isSpeedLimiter) = false;
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

    private "_speed";
    _speed = speed _vehicle;

    if (_speed > _maxSpeed) then {
        _vehicle setVelocity ((velocity _vehicle) vectorMultiply ((_maxSpeed / _speed) - 0.00001));  // fix 1.42-hotfix PhysX libraries applying force in previous direction when turning
    };

} , 0, [_driver, _vehicle, _maxSpeed]] call CBA_fnc_addPerFrameHandler;
