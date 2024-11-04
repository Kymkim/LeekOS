{ config, pkgs, inputs, ... }:
{
  imports = [
    ../../modules/nixos/default.nix
  ];
  steam.enable = true;
  printer.enable = true;
  fcitx5.enable = true;
  vms.enable = true;
  thunar.enable = true;
  
  environment.systemPackages = with pkgs; [
    #Most of these will be moved once they got their own configuration settings
    #In the meantime, these are appllications I like to run on my system
    #Please comment out the ones you dont need...
    rofi-wayland  #Temporarily here. Will use EWW or AGS for app launcher down the line
    nerdfonts     #Icons as fonts
    nwg-look      #For setting GTK themes
    pavucontrol   #GUI for PulseAudio 
    blueberry     #GUI for configuring Bluetooth Devices
    git
    vim
    wget
    curl
    firefox
    killall     
    gh                        #GitHub CLI Tool
    obsidian                  #Note taking app
    vscodium                  #Coding app
    discord                   #Chat application
    obs-studio                #Screen recording/streaming software
    zoom-us                   #Online conference calls
    unityhub                  #App for managing Unity Project and installation
    bottles
  
  ];
}