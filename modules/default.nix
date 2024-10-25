{ pkgs, lib, ... }:

{
    imports = [
        ./hyprland/hyprland.nix
    ];

    #Defaults
    hyprland.enable = lib.mkDefault true;
}