["ACE3 Equipment", QGVAR(ATragMXDialogKey), localize "STR_ACE_ATragMX_ATragMXDialogKey",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    if (GVAR(active)) exitWith {false};
    // Statement
    [] call FUNC(create_dialog);
    false
},
{false},
[0, [false, false, false]], false, 0] call CBA_fnc_addKeybind; // (empty default key)