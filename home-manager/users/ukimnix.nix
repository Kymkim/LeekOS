{ config, pkgs, lib, ... }:
{

  home.username = "ukimnix";
  home.homeDirectory = "/home/ukimnix";
  home.stateVersion = "24.11";

  imports = [
    ../../modules/home-manager
    ../common-packages
    ../fnott
    ../hyprland
    ../wallpaper/live.nix
    ../waybar
    ../terminal
  ];


  programs.home-manager = {
    enable = true;
  };
}
