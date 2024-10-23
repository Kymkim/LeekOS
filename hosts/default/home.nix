{ config, pkgs, ... }:

{
  home.username = "ukimnix";
  home.homeDirectory = "/home/ukimnix";

  home.stateVersion = "24.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    #Applications for my workstation. Of course, feel free to remove if you dont need these
	  obsidian
    vscodium
    discord
    obs-studio
#   bitwarden #Bitwarden does not want to compile lately. No clue why...
  ];

  #Hyprland Theme
  wayland.windowManager.htprland.settings = {
    "$mod" = "SUPER";
    bind = [
      "$mod, F, exec, firefox"
    ]
  };

  programs.home-manager.enable = true;
}
