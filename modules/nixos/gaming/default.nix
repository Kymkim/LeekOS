{ pkgs, lib, config, ... }:
{

  options = {
    system-modules.gaming.enable = lib.mkEnableOption "Enables Steam";
  };

  config = lib.mkIf config.system-modules.gaming.enable {  
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
  };

}