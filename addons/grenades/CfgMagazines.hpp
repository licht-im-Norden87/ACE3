class CfgMagazines {
    class HandGrenade;
    class ACE_HandFlare_Base: HandGrenade {
        scope = 1;
        value = 2;
        nameSoundWeapon = "smokeshell";
        nameSound = "smokeshell";
        mass = 4;
        initSpeed = 22;
    };
    class ACE_HandFlare_White: ACE_HandFlare_Base {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        ammo = "ACE_F_Hand_White";
        displayname = "$STR_ACE_Grenades_M127A1_White_Name";
        descriptionshort = "$STR_ACE_Grenades_M127A1_White_Description";
        displayNameShort = "$STR_ACE_Grenades_M127A1_White_NameShort";
        model = "\A3\weapons_f\ammo\flare_white";
        picture = "\A3\Weapons_F\Data\UI\gear_flare_white_ca.paa";
    };
    class ACE_HandFlare_Red: ACE_HandFlare_Base {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        ammo = "ACE_F_Hand_Red";
        displayname = "$STR_ACE_Grenades_M127A1_Red_Name";
        descriptionshort = "$STR_ACE_Grenades_M127A1_Red_Description";
        displayNameShort = "$STR_ACE_Grenades_M127A1_Red_NameShort";
        model = "\A3\weapons_f\ammo\flare_red";
        picture = "\A3\Weapons_F\Data\UI\gear_flare_red_ca.paa";
    };
    class ACE_HandFlare_Green: ACE_HandFlare_Base {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        ammo = "ACE_F_Hand_Green";
        displayname = "$STR_ACE_Grenades_M127A1_Green_Name";
        descriptionshort = "$STR_ACE_Grenades_M127A1_Green_Description";
        displayNameShort = "$STR_ACE_Grenades_M127A1_Green_NameShort";
        model = "\A3\weapons_f\ammo\flare_green";
        picture = "\A3\Weapons_F\Data\UI\gear_flare_green_ca.paa";
    };
    class ACE_HandFlare_Yellow: ACE_HandFlare_Base {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        ammo = "ACE_F_Hand_Yellow";
        displayname = "$STR_ACE_Grenades_M127A1_Yellow_Name";
        descriptionshort = "$STR_ACE_Grenades_M127A1_Yellow_Description";
        displayNameShort = "$STR_ACE_Grenades_M127A1_Yellow_NameShort";
        model = "\A3\weapons_f\ammo\flare_yellow";
        picture = "\A3\Weapons_F\Data\UI\gear_flare_yellow_ca.paa";
    };
    class ACE_M84: HandGrenade {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_G_M84";
        displayname = "$STR_ACE_Grenades_M84_Name";
        descriptionshort = "$STR_ACE_Grenades_M84_Description";
        displayNameShort = "M84";
        mass = 4;
        model = PATHTOF(models\ACE_m84.p3d);
        picture = PATHTOF(UI\ACE_m84_x_ca.paa);
    };

    class 3Rnd_UGL_FlareGreen_F;
    class 6Rnd_GreenSignal_F: 3Rnd_UGL_FlareGreen_F {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "F_40mm_Green";
        initSpeed = 120;
    };
    class 6Rnd_RedSignal_F: 6Rnd_GreenSignal_F {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "F_40mm_Red";
        initSpeed = 120;
    };
};
