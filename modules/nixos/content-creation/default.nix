{ pkgs, lib, config, ... }:
{

  options = {
    system-modules.content-creation.enable = lib.mkEnableOption "Adds various content creation related tools such as Krita, Darktable, kdenlive";
  };

  config = lib.mkIf config.system-modules.content-creation.enable {  
    environment.systemPackages = with pkgs; [
      darktable
      krita
      (wrapOBS {
        plugins = with obs-studio-plugins; [
          wlrobs
          obs-backgroundremoval
          obs-pipewire-audio-capture
        ];
      })
    ];
  };

}