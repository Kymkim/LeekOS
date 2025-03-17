{ config, pkgs, lib, ... }:
{

    home.packages = with pkgs; [
        kitty
        rofi
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
        (python3.withPackages(python-pkgs: [
            python-pkgs.pytorch
        ]))
        (callPackage ../../pkgs/zen-browser.nix{}) #Temporary Fix Till Zen Browser is in Nixpkgs

    ];

    programs.vscode = {
        enable = true;
    };

    nixpkgs.config = {
        allowUnfree = true;
    };

}
