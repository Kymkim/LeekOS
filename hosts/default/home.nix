{ config, pkgs, lib, ... }:

# Mainly used for declaratively setting themes and desktop environment stuff. Nothing else

{

  home.username = "ukimnix";
  home.homeDirectory = "/home/ukimnix";

  home.stateVersion = "24.05";

  imports = [
    ../../modules/home-manager/default.nix
  ];

  nixpkgs.config.allowUnfree = true; 

  programs = {
    home-manager.enable = true;
  };
}