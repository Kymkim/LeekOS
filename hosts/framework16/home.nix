{ config, pkgs, lib, ... }:

# Mainly used for declaratively setting themes and desktop environment stuff. Nothing else

{

  home.username = "ukimnix";
  home.homeDirectory = "/home/ukimnix";

  home.stateVersion = "24.05";

  imports = [
    ../../modules/home-manager/framework16.nix
  ];

  nixpkgs.config.allowUnfree = true; 

  programs = {
    home-manager.enable = true;
  };
}