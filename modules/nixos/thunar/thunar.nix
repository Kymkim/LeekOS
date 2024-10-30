{ pkgs, lib, config, ... }:
{

  options = {
    thunar.enable = lib.mkEnableOption "Enables Thunar File Manager";
  };

  config = lib.mkIf config.thunar.enable {  
    programs = {
      xfconf.enable = true;
      thunar = {
        enable = true;
        plugins = with pkgs.xfce; [
          thunar-archive-plugin
          thunar-volman
        ];
      }
    };
  };

}