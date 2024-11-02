{ pkgs, lib, config, inputs, ... }:

  # ░░      ░░░░      ░░░░      ░░
  # ▒  ▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒
  # ▓  ▓▓▓▓  ▓▓  ▓▓▓   ▓▓▓      ▓▓
  # █        ██  ████  ████████  █
  # █  ████  ███      ████      ██
                                                                         
  ###################################################################################
  # Aylur's GTK Shell for creating fucntional wayland widgets :)                    #
  #                                                                                 #
  #                                                                                 #
  # Website: https://aylur.github.io/ags-docs/                                      #
  ###################################################################################

{

  imports = [inputs.ags.homeManagerModules.default];

  options = {
    ags.enable = lib.mkEnableOption "Enables Aylur's GTK Shell";
  };

  config = lib.mkIf config.ags.enable {  
    programs.ags = {
      enable = true;
      configDir = ./config;
      extraPackages = with pkgs; [
        gtksourceview
        webkitgtk
        accountsservice
        nwg-look
      ];
    };
  };

}