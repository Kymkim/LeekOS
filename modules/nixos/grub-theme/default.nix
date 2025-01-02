{config, pkgs, lib, ... }:

{
  options = {
    system-modules.grub-theme = {

      enable = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Whether to enable custom grub theme";
      };

    };

  };

  config = lib.mkMerge [
    (
      lib.mkIf config.system-modules.grub-theme.enable {  
        boot.loader.grub.theme = ./theme;
      }
    )
  ];
}