
#define MACRO_REPAIRVEHICLE \
    class ACE_Actions { \
        class ACE_MainActions { \
            class GVAR(Repair) { \
                displayName = "$STR_ACE_Repair_Repair"; \
                condition = QUOTE([ARR_2(_player, _target)] call DFUNC(actionCanRepair)); \
                statement = QUOTE([ARR_2(_player, _target)] call DFUNC(actionRepair);); \
                showDisabled = 0; \
                priority = 2; \
                icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa"; \
                distance = 4; \
            }; \
        }; \
    };

class CfgVehicles {
    class LandVehicle;
    class Car: LandVehicle {
        MACRO_REPAIRVEHICLE
    };

    class Tank: LandVehicle {
        MACRO_REPAIRVEHICLE
    };

    class Air;
    class Helicopter: Air {
        MACRO_REPAIRVEHICLE
    };

    class Plane: Air {
        MACRO_REPAIRVEHICLE
    };

    class Ship;
    class Ship_F: Ship {
        MACRO_REPAIRVEHICLE
    };

    class ThingX;
    class ACE_RepairItem_Base: ThingX {
        icon = "iconObject_circle";
        mapSize = 0.7;
        accuracy = 0.2;
        vehicleClass = QGVAR(items);
        destrType = "DesturctNo";
    };

    class ACE_Track: ACE_RepairItem_Base {
        author = "Hawkins";
        scope = 2;
        model = QUOTE(PATHTOF(ace_track.p3d));
        displayName = "$STR_ACE_Repair_SpareTrack";
    };

    class ACE_Wheel: ACE_RepairItem_Base {
        author = "Hawkins";
        scope = 2;
        model = QUOTE(PATHTOF(ace_wheel.p3d));
        displayName = "$STR_ACE_Repair_SpareWheel";
        picture = QUOTE(PATHTOF(ui\tire_ca.paa));
    };
};
