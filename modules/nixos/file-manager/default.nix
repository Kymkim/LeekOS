{ pkgs, lib, config, ... }:
{

  options = {
    system-modules.file-manager.enable = lib.mkEnableOption "Adds file GUI file management utilities";
  };

  config = lib.mkIf config.system-modules.file-manager.enable {  
    programs = {
      xfconf.enable = true;
      thunar = {
        enable = true;
        plugins = with pkgs.xfce; [
          thunar-archive-plugin
          thunar-volman
          thunar-media-tags-plugin
        ];
      };
    };
    environment.systemPackages = with pkgs; [
      file-roller
      gnome-disk-utility
      image-roll
      mplayer
    ];
    services = {
      udisks2.enable = true;
      devmon.enable = true;
      gvfs.enable = true;
    };
  };

}