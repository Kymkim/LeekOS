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
    webcord                 #Chat application
    (wrapOBS {
      plugins = with obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })
    zoom-us                   #Online conference calls
    unityhub                  #App for managing Unity Project and installation
    bottles
    libreoffice
    picard
    unzip

    #Temporary Fix Hopefully we can move this somewhere
    xdg-desktop-portal
    xdg-desktop-portal-hyprland

    pipewire
    wireplumber
    iwgtk
  ];

  nixpkgs.config.allowUnfree = true; 
  programs.pywal.enable = true;
  gtk-theme.enable = true;
  hyprland.Fcitx5.enable = true;
  ags.enable = true;

  programs = {
    home-manager.enable = true;
  };
}