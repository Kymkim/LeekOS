{ pkgs, lib, config, ... }:
{

  options = {
    system-modules.wireless.enable = lib.mkEnableOption "Enables Wireless connection such as Bluetooth and WiFi";
  };

  config = lib.mkIf config.system-modules.wireless.enable {  
    networking = {
      hostName = "HyprMikuOS";
      networkmanager.enable = true;
    };
    programs.nm-applet.enable = true;
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    environment.systemPackages = with pkgs; [
      blueberry     #GUI for configuring Bluetooth Devices
    ];
  };

}