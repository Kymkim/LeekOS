{ config, pkgs, ... }:

{
  home.username = "ukimnix";
  home.homeDirectory = "/home/ukimnix";

  home.stateVersion = "24.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = [
	  pkgs.obsidian
    pkgs.vscodium
    pkgs.discord
    pkgs.obs-studio
#   pkgs.bitwarden #Bitwarden does not want to compile lately. No clue why...
  ];

  programs.home-manager.enable = true;
}
