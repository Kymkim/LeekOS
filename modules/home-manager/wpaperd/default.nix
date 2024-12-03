{ pkgs, lib, config }:

{

  options = {
    wpaperd = {
      
      enable = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = ''
          Whether to enable or disable wallpaper support using wpaperd
        ''
      };

      monitors = {
        default = [ "HDMI-A-1" ];
        example = [ "HDMI-A-1"  "HDMI-A-2" ];
        type = lib.types.listOf lib.types.str;
        description = ''
          Monitors to appy the wallpaper to
        '';
      };
      
      path = lib.mkOption {
        default = ./wallpapers;
        example = ./path/to/wallpapers;
        type = lib.types.str;
        description = ''
          The path where the wallpapers are stored
        '';
      };

    };
  };

  config = lib.mkIf config.wpaperd.enable {

    programs.wpaperd = {

      enable = true;

      settings = {

      };

    };

  };

}