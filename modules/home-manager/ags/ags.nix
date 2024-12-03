{ pkgs, lib, config, inputs, ... }:

{

  imports = [inputs.ags.homeManagerModules.default];

  options.ags = {
    enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Whether to use AGS";
    };
  };

  config = lib.mkIf config.ags.enable {  
    programs.ags = {
      enable = true;
      extraPackages = with pkgs; [
        gtksourceview
        webkitgtk
        accountsservice
        nwg-look
      ];
    };
    home.file.".config/ags" = {
      source = ./config;
      recursive = true;
    };
  };

}