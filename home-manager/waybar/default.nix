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
                ];

                modules-left = [
                    "clock"
                ];
                modules-center = [
                    "hyprland/workspaces"
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

                "clock" = {
                    tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                    format-alt = "{:%Y-%m-%d}";
                };
            };
            secondaryBar = {
                layer = "top";
                position = "bottom";
                height = 40;
                output = [
                    "eDP-1"
                ];
            };

        };

        style = ''
            * {
                border: none;
                background: #000000;
                color: #FFFFFF;
            }
            #clock{
                padding: 0 10px;
            }
            #workspaces button{
                box-shadow: none;
                border-radius: 90px;
                padding: 0px;
            }
            #workspaces button.active {
                color: #000000;
                background-color: #ffffff;
            }
        '';
    };
}
