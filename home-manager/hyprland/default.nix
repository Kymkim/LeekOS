{ pkgs, lib, config, ... }:
{

  # Hyprland Configuration (Default)

  wayland.windowManager.hyprland = {
    
    enable = true;

    plugins = with pkgs.hyprlandPlugins; [
      hy3
      borders-plus-plus
      hyprtrails
      hyprbars
      hyprexpo
    ];

    settings = {

      plugin = {

        borders-plus-plus = {
          add_borders = 1;
          col.border_1 = "rgb(FFFFFF)";
          col.border_2 = "rgb(2222FF)";
          border_size_1 = 10;
          border_size_2 = 5;
        };

      }

      general = {
        gaps_in = 5;
        gaps_out = 5;
      };

    };

  }
}