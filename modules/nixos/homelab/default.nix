{ pkgs, lib, config, ... }:
{

  options = {
    system-modules.homelab.enable = lib.mkEnableOption "Enables Homelab related tools such as FreeCAD and Cura";
  };

  config = lib.mkIf config.system-modules.homelab.enable {  
    environment.systemPackages = with pkgs; [
      #cura         #As of 11-12-2024: Cura is broken due to python3.12-libarcus
      freecad
    ];
  };

}