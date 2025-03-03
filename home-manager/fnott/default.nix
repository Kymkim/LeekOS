{ pkgs, lib, config, ... }:
{

    home.packages = with pkgs; [
        libnotify
    ];

    services.fnott = {
        enable = true;
        settings = {
            main = {
                max-timeout = 5;
                border-radius = 10;
                background = "00000088";
                min-width = 200;
                border-color = "dbe9f4ff";
                border-size = 2;
            };
        };
    };
}
