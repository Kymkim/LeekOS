{config, pkgs, lib, ... }:

{
  options = {
    system-modules.sddm = {

      enable = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Whether to enable SDDM as a login screen";
      };

    };

  };

  config = lib.mkMerge [
    (
      lib.mkIf config.system-modules.sddm.enable {  
        services = {
          displayManager = {
            sddm = {
                enable = true;
                wayland.enable = true;
            };
          };
        };
      }
    )
  ];
}