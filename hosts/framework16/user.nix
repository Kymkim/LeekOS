{ config, pkgs, lib, ... }:

# Mainly used for declaratively setting themes and desktop environment stuff. Nothing else

{

  home.username = "ukimnix";
  home.homeDirectory = "/home/ukimnix";
  home.stateVersion = "24.05";

  imports = [
    ../../modules/home-manager
  ];

  home.packages = with pkgs; [
    #Most of these will be moved once they got their own configuration settings
    #In the meantime, these are appllications I like to run on my system
    #Please comment out the ones you dont need...
    rofi-wayland  #Temporarily here. Will use EWW or AGS for app launcher down the line
    nwg-look      #For setting GTK themes
    vim
    wget
    curl
    firefox  
    obsidian                  #Note taking app
    vscodium                  #Coding app
    discord                   #Chat application
    zoom-us                   #Online conference calls
    unityhub                  #App for managing Unity Project and installation
    libreoffice

    #Temporary Fix Hopefully we can move this somewhere
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    iwgtk
  ];

  nixpkgs.config.allowUnfree = true;
  hyprland.FW16config = true;
  terminal.FW16config = true;
  hyprland.Fcitx5.enable = true;
  programs.pywal.enable = true;
  gtk-theme.enable = true;

  programs = {
    home-manager.enable = true;
  };
}
