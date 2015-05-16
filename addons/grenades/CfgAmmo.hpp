class CfgAmmo {
    class FlareCore;
    class FlareBase: FlareCore {
        intensity = 20000;
        flareSize = 12;
    };
    class F_40mm_White: FlareBase {
        intensity = 40000;
        flareSize = 12;
    };
    class F_20mm_White: FlareBase {
        intensity = 20000;
        flareSize = 12;
    };
    class F_Signal_Green: FlareBase {
        intensity = 20000;
        flareSize = 12;
    };
    class Flare_82mm_AMOS_White: FlareCore {
        intensity = 80000;
        flareSize = 12;
    };

    class F_20mm_Red: F_20mm_White {};
    class F_20mm_Green: F_20mm_White {};
    class F_20mm_Yellow: F_20mm_White {};

    class ACE_F_Hand_White: F_20mm_White {
        grenadeBurningSound[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
        grenadeFireSound[] = {"SmokeShellSoundHit1",0.25,"SmokeShellSoundHit2",0.25,"SmokeShellSoundHit3",0.5};
        soundTrigger[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
        SmokeShellSoundHit1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_1",1.25893,1,100};
        SmokeShellSoundHit2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_2",1.25893,1,100};
        SmokeShellSoundHit3[] = {"A3\Sounds_F\weapons\smokeshell\smoke_3",1.25893,1,100};
        SmokeShellSoundLoop1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop1",0.125893,1,70};
        SmokeShellSoundLoop2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop2",0.125893,1,70};
        timeToLive = 60;
    };
    class ACE_F_Hand_Red: F_20mm_Red {
        grenadeBurningSound[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
        grenadeFireSound[] = {"SmokeShellSoundHit1",0.25,"SmokeShellSoundHit2",0.25,"SmokeShellSoundHit3",0.5};
        soundTrigger[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
        SmokeShellSoundHit1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_1",1.25893,1,100};
        SmokeShellSoundHit2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_2",1.25893,1,100};
        SmokeShellSoundHit3[] = {"A3\Sounds_F\weapons\smokeshell\smoke_3",1.25893,1,100};
        SmokeShellSoundLoop1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop1",0.125893,1,70};
        SmokeShellSoundLoop2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop2",0.125893,1,70};
        timeToLive = 60;
    };
    class ACE_F_Hand_Green: F_20mm_Green {
        grenadeBurningSound[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
        grenadeFireSound[] = {"SmokeShellSoundHit1",0.25,"SmokeShellSoundHit2",0.25,"SmokeShellSoundHit3",0.5};
        soundTrigger[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
        SmokeShellSoundHit1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_1",1.25893,1,100};
        SmokeShellSoundHit2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_2",1.25893,1,100};
        SmokeShellSoundHit3[] = {"A3\Sounds_F\weapons\smokeshell\smoke_3",1.25893,1,100};
        SmokeShellSoundLoop1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop1",0.125893,1,70};
        SmokeShellSoundLoop2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop2",0.125893,1,70};
        timeToLive = 60;
    };
    class ACE_F_Hand_Yellow: F_20mm_Yellow {
        grenadeBurningSound[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
        grenadeFireSound[] = {"SmokeShellSoundHit1",0.25,"SmokeShellSoundHit2",0.25,"SmokeShellSoundHit3",0.5};
        soundTrigger[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
        SmokeShellSoundHit1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_1",1.25893,1,100};
        SmokeShellSoundHit2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_2",1.25893,1,100};
        SmokeShellSoundHit3[] = {"A3\Sounds_F\weapons\smokeshell\smoke_3",1.25893,1,100};
        SmokeShellSoundLoop1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop1",0.125893,1,70};
        SmokeShellSoundLoop2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop2",0.125893,1,70};
        timeToLive = 60;
    };

    class ACE_G_M84: F_20mm_Yellow {
        useFlare = 0;
        flareSize = 0;
        intensity = 0;
        grenadeBurningSound[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
        grenadeFireSound[] = {"SmokeShellSoundHit1",0.25,"SmokeShellSoundHit2",0.25,"SmokeShellSoundHit3",0.5};
        soundTrigger[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
        SmokeShellSoundHit1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_1",1.25893,1,100};
        SmokeShellSoundHit2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_2",1.25893,1,100};
        SmokeShellSoundHit3[] = {"A3\Sounds_F\weapons\smokeshell\smoke_3",1.25893,1,100};
        SmokeShellSoundLoop1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop1",0.125893,1,70};
        SmokeShellSoundLoop2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop2",0.125893,1,70};
        timeToLive = 6;
        fuseDistance = 2.3;
        model = PATHTOF(models\ACE_m84_thrown.p3d);
    };
};
