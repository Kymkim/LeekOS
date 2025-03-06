{ pkgs, lib, config, ... }:
{


    programs.waybar = {
        enable = true;

        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 40;
                output = [
                    "eDP-1"
                    "DP-2"
                ];

                modules-left = [
                    "clock"
                ];
                modules-center = [
                    "hyprland/window"
                ];
                modules-right = [
                    "battery"
                ];


                "hyprland/window" = {
                    format = "{}";
                };

                "battery" = {
                    bat = "BAT1";
                    interval = 60;
                    states = {
                        perfect = 90;
                        normal = 80;
                        warning = 20;
                        critical = 10;
                    };
                    format = "{icon} {capacity}%";
                    format-icons = [
                        "▣□□□□"
                        "■□□□□"
                        "■▣□□□"
                        "■■□□□"
                        "■■▣□□"
                        "■■■□□"
                        "■■■▣□"
                        "■■■■□"
                        "■■■■▣"
                        "■■■■■"
                    ];
                    max-length = 25;
                };

                "clock" = {
                    tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                    format = "{:%I:%M %p}";
                    format-alt = "{:%Y-%m-%d}";
                };
            };
            secondaryBar = {
                layer = "top";
                position = "bottom";
                height = 40;
                output = [
                    "eDP-1"
                    "DP-2"
                ];

                modules-center = [
                    "hyprland/workspaces"
                ];

                modules-right = [
                    "wireplumber"
                ];

                "hyprland/workspaces" = {
                    format = "{icon}";
                    format-icons = {
                        "active" = "x";
                        "default" = "-";
                    };
                    persistent-workspaces = {
                        "*" = 9;
                    };
                };

                "wireplumber" = {
                    "format" = "{icon}   {volume}%";
                    "format-icons" = ["" "" ""];
                };

                "backlight/slider" = {
                    min = 0;
                    max = 100;
                    orientation = "vertical";
                    device = "intel_backlight";
                };

            };

        };

        style = ''
            * {
                border: none;
                background: #000000;
                color: #FFFFFF;
                font-size: 20px;
            }

            #clock{
                padding: 0 20px;
            }

            #workspaces button{
                box-shadow: none;
                border-radius: 90px;
                padding: 0px;
                font-size: 25px;
            }
            #workspaces button.active {
                color: #000000;
                background-color: #ffffff;
                font-size: 30px;
            }

            #backlight-slider slider {
                min-height: 0px;
                min-width: 0px;
                opacity: 0;
                background-image: none;
                box-shadow: none;
            }
            #backlight-slider highlight {
                min-width: 20px;
                border-radius: 0px;
                background-color: white;
            }

            #battery {
                padding: 0 20px
            }
            #battery.normal{
                color: white;
            }
            #battery.perfect{
                color:rgb(99, 240, 235);
            }
            #battery.discharging {
                color:rgb(255, 255, 255);
            }
            #battery.warning {
                color:rgb(255, 205, 66);
            }
            #battery.critical {
                color:rgb(255, 80, 67);
            }
            #battery.charging{
                color:rgb(155, 238, 235);
            }

            #wireplumber {
                padding: 0 20px;
            }
        '';
    };
}
