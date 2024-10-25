{ config, pkgs, lib, ... }:

{

  home.username = "ukimnix";
  home.homeDirectory = "/home/ukimnix";

  home.stateVersion = "24.05";

  imports = [
    ../../modules/default.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # ░░      ░░░       ░░░       ░░░░      ░░
  # ▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒
  # ▓  ▓▓▓▓  ▓▓       ▓▓▓       ▓▓▓▓      ▓▓
  # █        ██  ████████  ██████████████  █
  # █  ████  ██  ████████  █████████      ██

  ########################################################                                      
  # Applications for my workstation.                     #
  #Of course, feel free to remove if you dont need these #
  ########################################################

  home.packages = with pkgs; [
	  obsidian    #Note taking app
    vscodium    #Coding app
    discord     #Chat application
    obs-studio  #Screen recording/streaming software
    zoom-us     #Online conference calls
    unityhub    #App for managing Unity Project and installation
#   bitwarden   #Password manager: Bitwarden does not want to compile lately. No clue why...
  ];

  programs.home-manager.enable = true;
}