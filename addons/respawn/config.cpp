#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = { "ACE_Rallypoint_West", "ACE_Rallypoint_East", "ACE_Rallypoint_Independent", "ACE_RallypointExit_West", "ACE_RallypointExit_East", "ACE_RallypointExit_Independent" };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { "ace_common" };
        author[] = { "bux578", "commy2" };
        authorUrl = "https://github.com/bux578/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgAddons.hpp"
#include "CfgVehicleClasses.hpp"
#include "CfgVehicles.hpp"
#include "ACE_Settings.hpp"
