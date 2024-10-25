{ pkgs, lib, config, ... }:

  # ░░      ░░░        ░░        ░░░      ░░░  ░░░░  ░
  # ▒  ▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒   ▒▒   ▒
  # ▓▓      ▓▓▓▓▓▓  ▓▓▓▓▓      ▓▓▓▓  ▓▓▓▓  ▓▓        ▓
  # ███████  █████  █████  ████████        ██  █  █  █
  # ██      ██████  █████        ██  ████  ██  ████  █
                                                  
  ###################################################################################
  # "Steam is the ultimate destination for playing, discussing, and creating games" #
  # (That's what their website says..).                                             #
  #                                                                                 #
  # Website: https://store.steampowered.com/                                        #
  ###################################################################################

{

  options = {
    steam.enable = lib.mkEnableOption "Enables Steam";
  };

  config = lib.mkIf config.steam.enable {  
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
  };

}