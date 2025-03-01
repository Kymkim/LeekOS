{ config, pkgs, lib, ... }:
{

    home.packages = with pkgs; [
        firefox
        kitty
        rofi
        vscode
        obsidian
        webcord
        plexamp
        libreoffice
        btop
    ];

    nixpkgs.config = {
        allowUnfree = true;
    };

}
