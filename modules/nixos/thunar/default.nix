{ pkgs, lib, config, ... }:
{

  options = {
    system-modules.thunar.enable = lib.mkEnableOption "Enables Thunar File Manager";
  };

  config = lib.mkIf config.system-modules.thunar.enable {  
    programs = {
      xfconf.enable = true;
      thunar = {
        enable = true;
        plugins = with pkgs.xfce; [
          thunar-archive-plugin
          thunar-volman
        ];
      };
    };
    environment.systemPackages = with pkgs; [
      file-roller
    ];
    services = {
      udisks2.enable = true;
    };
  };

}