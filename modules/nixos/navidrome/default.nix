{config, pkgs, lib, ... }:

{
  options = {
    system-modules.navidrome = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Whether to enable Navidrome Support";
      };

    };

  };

  config = lib.mkMerge [
    (
      lib.mkIf config.system-modules.navidrome.enable {  
        systemd.services.navidrome.serviceConfig.ProtectHome = lib.mkForce "read-only";
        services.navidrome = {
          enable = true;
          settings = {
            MusicFolder = "/home/ukimnix/Archive/Media/Music";
            EnableSharing = true;
            Address = "localhost";
          };
        };
      }
    )
  ];
}