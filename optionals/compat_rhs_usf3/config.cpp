#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"rhsusf_c_weapons"};
        author[]={"Ruthberg"};
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgWeapons.hpp"
