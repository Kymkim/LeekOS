{ config, pkgs, lib, ... }:
{

  home.username = "ukimnix";
  home.homeDirectory = "/home/ukimnix";
  home.stateVersion = "24.05";

  imports = [
    ../../modules/home-manager
    ../hyprland
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  home.packages = with pkgs; [
    firefox
    kitty
    rofi
    vscode
    obsidian
  ];

  programs.home-manager.enable = true;
}
