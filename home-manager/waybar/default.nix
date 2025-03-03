{ pkgs, lib, config, ... }:
{
    programs.waybar = {
        enable = true;

        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 30;
                output = [
                    "eDP-1"
                ];

                modules-left = [
                    "clock"
                ];

                "clock" = {
                    tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                    format-alt = "{:%Y-%m-%d}";
                };
            };
            secondaryBar = {
                layer = "top";
                position = "bottom";
                height = 30;
                output = [
                    "eDP-1"
                ];
            };
        };

        style = ''
            * {
                border: none;
                background: #000000;
            }
            #clock{
                padding: 0 10px;
                color: #FFFFFF;
            }
        '';
    };
}
