{ pkgs, lib, config, ... }:
{

  options = {
    system-modules.gaming.enable = lib.mkEnableOption "Enables Steam";
    system-modules.gaming.emulation = lib.mkEnableOption "Enables various console emulation tools";
  };

  config = lib.mkIf config.system-modules.gaming.enable {  

    #Enables controller support for Steam Hardware
    hardware.steam-hardware.enable = true;

    programs.steam = {
      enable = true;

      #Open ports in firewall
      remotePlay.openFirewall = true;  
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;

    }; 

    environment.systemPackages = with pkgs; [ 
      lutris
      wineWowPackages.waylandFull
    ];

  };

}