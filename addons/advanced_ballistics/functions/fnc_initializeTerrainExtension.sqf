/*
 * Author: Ruthberg
 * Initializes the advanced ballistics dll extension with terrain data
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Public: No
 */
#include "script_component.hpp"

if (!hasInterface) exitWith {};
if (!GVAR(enabled)) exitWith {};
if (!GVAR(extensionAvailable)) exitWith {};

private ["_initStartTime", "_mapSize", "_mapGrids", "_gridCells", "_x", "_y", "_gridCenter", "_gridHeight", "_gridNumObjects", "_gridSurfaceIsWater"];

_initStartTime = time;
_mapSize = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");

if (("ace_advanced_ballistics" callExtension format["init:%1:%2", worldName, _mapSize]) == "Terrain already initialized") exitWith {
    if (GVAR(initMessageEnabled)) then {
        systemChat "AdvancedBallistics: Terrain already initialized";
    };
};

_mapGrids = ceil(_mapSize / 50) + 1;
_gridCells = _mapGrids * _mapGrids;

GVAR(currentGrid) = 0;

[{
    private ["_args", "_mapGrids", "_gridCells", "_initStartTime"];
    _args = _this select 0;
    _mapGrids = _args select 0;
    _gridCells = _args select 1;
    _initStartTime = _args select 2;
    
    if (GVAR(currentGrid) >= _gridCells) exitWith {
        if (GVAR(initMessageEnabled)) then {
            systemChat format["AdvancedBallistics: Finished terrain initialization in %1 seconds", ceil(time - _initStartTime)];
        };
        [_this select 1] call cba_fnc_removePerFrameHandler;
    };
    
    for "_i" from 1 to 50 do {
        _x = floor(GVAR(currentGrid) / _mapGrids) * 50;
        _y = (GVAR(currentGrid) - floor(GVAR(currentGrid) / _mapGrids) * _mapGrids) * 50;
        _gridCenter = [_x + 25, _y + 25];
        _gridHeight = round(getTerrainHeightASL _gridCenter);
        _gridNumObjects = count (_gridCenter nearObjects ["Building", 50]);
        _gridSurfaceIsWater = if (surfaceIsWater _gridCenter) then {1} else {0};
        "ace_advanced_ballistics" callExtension format["set:%1:%2:%3", _gridHeight, _gridNumObjects, _gridSurfaceIsWater];
        GVAR(currentGrid) = GVAR(currentGrid) + 1;
        if (GVAR(currentGrid) >= _gridCells) exitWith {};
    };
        
}, 0, [_mapGrids, _gridCells, _initStartTime]] call CBA_fnc_addPerFrameHandler
