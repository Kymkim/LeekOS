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
        obs-studio
        neofetch
        pwvucontrol
        (callPackage ../../pkgs/zen-browser.nix{})
    ];

    nixpkgs.config = {
        allowUnfree = true;
    };

}
