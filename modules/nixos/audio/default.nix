{ pkgs, lib, config, ... }:
{

  options = {
    system-modules.audio.enable = lib.mkEnableOption "Enables audio support";
  };

  config = lib.mkIf config.system-modules.audio.enable {  
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    environment.systemPackages = with pkgs; [
      pwvucontrol   #PipeWire GUI
    ];
  };

}