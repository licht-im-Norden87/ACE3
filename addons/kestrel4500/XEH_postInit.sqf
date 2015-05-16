#include "script_component.hpp"

#include "initKeybinds.sqf"

GVAR(Menus) = ["Direction", "Wind SPD  m/s", "CROSSWIND m/s", "HEADWIND  m/s", "TEMP       °C", "HUMIDITY    %", "BARO      hPA", "ALTITUDE    m", "User Screen   1", "User Screen   2"];

GVAR(TOTAL) = [0, 0, 0, 0, 0, 0, 0, 0];
GVAR(ENTRIES) = [0, 0, 0, 0, 0, 0, 0, 0];

GVAR(MinAvgMax) = false;
GVAR(MinAvgMaxMode) = 0;

GVAR(Menu) = 1;
GVAR(Directions) = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"];
GVAR(Direction) = 0;

GVAR(RefHeading) = 0;

GVAR(updateTimer) = 0;
GVAR(outputData) = ["", "", "", "", "", "", "", "", "", ""];
GVAR(MeasuredWindSpeed) = 0;
GVAR(ImpellerState) = 0;

GVAR(Kestrel4500) = false;
GVAR(Overlay) = false;

[] call FUNC(restoreUserData);