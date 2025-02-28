{ config, pkgs, lib, ... }:
{

  home.username = "ukimnix";
  home.homeDirectory = "/home/ukimnix";
  home.stateVersion = "24.05";

  imports = [
    ../../modules/home-manager
    ../hyprland
  ];

  home.packages = with pkgs; [
    firefox
    kitty
    rofi
    vscodium
    obsidian
  ];

  programs.home-manager.enable = true;
}
