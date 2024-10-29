#All modules configuration files
{ pkgs, lib, config, ... }:

{
    imports = [
        ./hyprland/hyprland.nix
        ./terminal/terminal.nix
        ./ags/ags.nix
    ];

    #Everything is enabled by default.
    hyprland.enable = lib.mkDefault true;
    hyprland.FW16config = lib.mkDefault false;
    kitty.enable = lib.mkDefault true;
    starship.enable = lib.mkDefault true;
    zsh.enable = lib.mkDefault true;
    ags.enable = lib.mkDefault true;
}