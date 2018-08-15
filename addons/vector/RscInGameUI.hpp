
class RscText;
class RscPicture;

//class ScrollBar;
class RscControlsGroup {
    class VScrollbar;//: ScrollBar {};
    class HScrollbar;//: ScrollBar {};
};

class RscInGameUI {
    class RscUnitInfo;
    class ACE_RscOptics_vector: RscUnitInfo {
        onLoad = "[""onLoad"",_this,""RscUnitInfo"",'IGUI'] call    (uinamespace getvariable 'BIS_fnc_initDisplay'); uiNamespace setVariable ['ACE_dlgVector', _this select 0];";
        onUnload = "[""onUnload"",_this,""RscUnitInfo"",'IGUI'] call    (uinamespace getvariable 'BIS_fnc_initDisplay')";
        idd = 300;
        controls[] = {"CA_Distance","CA_Heading","CA_OpticsPitch","CA_Elev","CA_OpticsZoom","CA_VisionMode","ACE_ScriptedDisplayControlsGroup"};

        class CA_Distance: RscText {
            idc = 151;  // distance
            w = 0;
            h = 0;
        };

        class CA_Heading: RscText {
            idc = 156;  // azimuth
            w = 0;
            h = 0;
        };

        class CA_OpticsPitch: RscText {
            idc = 182;  // inclination
            w = 0;
            h = 0;
        };

        class CA_Elev: RscText {
            idc = 175;  // inclination, more accurate
            w = 0;
            h = 0;
        };

        class CA_OpticsZoom: RscText {
            idc = 180;  // some kind of zoom
            w = 0;
            h = 0;
        };

        class CA_VisionMode: RscText {
            idc = 179;  // ???
            w = 0;
            h = 0;
        };

        class ACE_ScriptedDisplayControlsGroup: RscControlsGroup {
            idc = 170;
            x = "SafezoneX";
            y = "SafezoneY";
            w = "SafezoneW";
            h = "SafezoneH";

            class VScrollbar: VScrollbar {
                width = 0;
            };

            class HScrollbar: HScrollbar {
                height = 0;
            };

            class controls {
                class Center: RscPicture {
                    idc = 1301;
                    text = "";
                    colorText[] = {1,0,0,0.5};
                    x = 0.488 * safezoneW /*+ safezoneX*/;
                    y = 0.4783 * safezoneH /*+ safezoneY*/;
                    w = 0.4 / 16 * safezoneW;
                    h = 0.4 / 9 * safezoneH;
                };

                class Crosshair: Center {
                    idc = 1302;
                    x = 0.4848 * safezoneW /*+ safezoneX*/;
                    y = 0.4732 * safezoneH /*+ safezoneY*/;
                    w = 0.5 / 16 * safezoneW;
                    h = 0.5 / 9 * safezoneH;
                };

                class Digit0: Center {
                    idc = 1310;
                    x = (0.54 + 0 * 0.02) * safezoneW /*+ safezoneX*/;
                    y = 0.54 * safezoneH /*+ safezoneY*/;
                    w = 0.5 / 16 * safezoneW;
                    h = 0.5 / 9 * safezoneH;
                };

                class Digit1: Digit0 {
                    idc = 1311;
                    x = (0.54 + 1 * 0.02) * safezoneW /*+ safezoneX*/;
                };

                class Digit2: Digit0 {
                    idc = 1312;
                    x = (0.54 + 2 * 0.02) * safezoneW /*+ safezoneX*/;
                };

                class Digit3: Digit0 {
                    idc = 1313;
                    x = (0.54 + 3 * 0.02) * safezoneW /*+ safezoneX*/;
                };

                class Digit4: Digit0 {
                    idc = 1314;
                    x = (0.54 + 4 * 0.02) * safezoneW /*+ safezoneX*/;
                };

                class Digit5: Digit0 {
                    idc = 1315;
                    x = (0.35 + 0 * 0.02) * safezoneW /*+ safezoneX*/;
                };

                class Digit6: Digit0 {
                    idc = 1316;
                    x = (0.35 + 1 * 0.02) * safezoneW /*+ safezoneX*/;
                };

                class Digit7: Digit0 {
                    idc = 1317;
                    x = (0.35 + 2 * 0.02) * safezoneW /*+ safezoneX*/;
                };

                class Digit8: Digit0 {
                    idc = 1318;
                    x = (0.35 + 3 * 0.02) * safezoneW /*+ safezoneX*/;
                };

                class Digit9: Digit0 {
                    idc = 1319;
                    x = (0.35 + 4 * 0.02) * safezoneW /*+ safezoneX*/;
                };

                class DigitE1: Digit0 {
                    idc = 1321;
                    x = (0.39 + 0 * 0.02) * safezoneW /*+ safezoneX*/;
                    y = 0.42 * safezoneH /*+ safezoneY*/;
                };

                class DigitE2: DigitE1 {
                    idc = 1322;
                    x = (0.39 + 1 * 0.02) * safezoneW /*+ safezoneX*/;
                };

                class DigitE3: DigitE1 {
                    idc = 1323;
                    x = (0.39 + 2 * 0.02) * safezoneW /*+ safezoneX*/;
                };

                class DigitE4: DigitE1 {
                    idc = 1324;
                    x = (0.39 + 3 * 0.02) * safezoneW /*+ safezoneX*/;
                };
            };
        };
    };
};
