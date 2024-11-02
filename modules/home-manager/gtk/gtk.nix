{ pkgs, lib, config, ... }:
{

  options = {
    gtk-theme.enable = lib.mkEnableOption "Enables GTK Theming";
  };

  config = lib.mkIf config.gtk-theme.enable {  
    gtk = {
      enable = true;
      iconTheme = {
        package = pkgs.gnome.adwaita-icon-theme;
        name = "Adawaita";
      };
      theme = {
        package = pkgs.tokyonight-gtk-theme;
        name = "Tokyonight-Dark";
      };
    };
  };

}