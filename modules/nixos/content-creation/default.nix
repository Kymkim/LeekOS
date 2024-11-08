{ pkgs, lib, config, ... }:
{

  options = {
    system-modules.content-creation.enable = lib.mkEnableOption "Adds various content creation related tools such as Krita, Darktable, kdenlive";
    system-modules.content-creation.v4l2DSLR = lib.mkEnableOption "Enables virtual camera support";
  };

  config = lib.mkMerge [
    (
      lib.mkIf config.system-modules.content-creation.enable {  
        environment.systemPackages = with pkgs; [
          #Editing Software
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
      }
    )
    (
      lib.mkIf config.system-modules.content-creation.v4l2DSLR {
        environment.systemPackages = with pkgs; [
          #DSLR as Camera
          ffmpeg_6-full
          gphoto2
          mpv
          v4l-utils
        ];
        #Kernel change to support virtual camera
        boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback.out ];
        boot.kernelModules = [
          "v4l2loopback"
        ];
        boot.extraModprobeConfig = ''
          options v4l2loopback exclusive_caps=1 card_label="DSLR Camera"
        '';
      }
    )
  ];
}