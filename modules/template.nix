{config, pkgs, lib, ... }:

{
  options = {
    system-modules.title = {

      featureA = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Whether to enable featureA";
      };

      featureB = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Whether to enable featureB";
      };

    };

  };

  config = lib.mkMerge [
    (
      lib.mkIf config.system-modules.title.featureA {  

      }
    )
    (
      lib.mkIf config.system-modules.title.featureB {

      }
    )
  ];
}