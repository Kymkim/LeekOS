{ pkgs, lib, config, ... }:
{

  options = {
    system-modules.fcitx5.enable = lib.mkEnableOption "Enables Japanese mozc with Fcitx5";
  };

  config = lib.mkIf config.system-modules.fcitx5.enable {  
    i18n.inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
      ];
      fcitx5.waylandFrontend = true;
    };
  };

}