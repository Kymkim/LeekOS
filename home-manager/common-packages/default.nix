{ config, pkgs, lib, ... }:
{

    home.packages = with pkgs; [
        kitty
        rofi
        vscode
        obsidian
        webcord
        plexamp
        libreoffice
        btop
        obs-studio
        neofetch
        pwvucontrol
        zoom-us
        unityhub
        (callPackage ../../pkgs/zen-browser.nix{}) #Temporary Fix Till Zen Browser is in Nixpkgs

    ];

    nixpkgs.config = {
        allowUnfree = true;
    };

}
