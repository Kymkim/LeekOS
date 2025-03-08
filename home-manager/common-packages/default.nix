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
        (callPackage ../../pkgs/zen-browser.nix{}) #Temporary Fix Till Zen Browser is in Nixpkgs

    ];

    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            dracula-theme.theme-dracula
            yzhang.markdown-all-in-one
            #ms-python.python
        ];
    };

    nixpkgs.config = {
        allowUnfree = true;
    };

}
