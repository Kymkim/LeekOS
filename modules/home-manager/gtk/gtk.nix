{ pkgs, lib, config, ... }:

  # ░░      ░░░        ░░        ░░░      ░░░  ░░░░  ░
  # ▒  ▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒   ▒▒   ▒
  # ▓▓      ▓▓▓▓▓▓  ▓▓▓▓▓      ▓▓▓▓  ▓▓▓▓  ▓▓        ▓
  # ███████  █████  █████  ████████        ██  █  █  █
  # ██      ██████  █████        ██  ████  ██  ████  █
                                                  
  ###################################################################################
  # "Steam is the ultimate destination for playing, discussing, and creating games" #
  # (That's what their website says..).                                             #
  #                                                                                 #
  # Website: https://store.steampowered.com/                                        #
  ###################################################################################

{

  options = {
    gtk.enable = lib.mkEnableOption "Enables GTK Theming";
  };

  config = lib.mkIf config.gtk.enable {  
    gtk = {
      enable = true;
      iconTheme = {
        package = pkgs.gnome.adwaita-icon-theme;
        name = "Adawaita";
      };
    };
  };

}