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

      monitor = [
        "eDP-1, preferred, auto, 1.25"
      ];

      env = [
        "XCURSOR_SIZE, 48"
      ];

      bind = [
        ""
      ];

      general = {
        gaps_in = 5;
        gaps_out = 5;
        resize_on_border = true;
        extend_border_grab_area = 20;
        hover_icon_on_border = true;

        snap = {
          enable = true;
        };
      };

      decoration = {
        blur = {
          enabled = true;
        }
      };

      animations = {
        enabled = true;
      };

      input = {
        touchpad = {
          natural_scroll = true;
        }
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
      }

      misc {
        disable_hyprland_logo = true;
        animate_manual_resizes = true;
        animate_mouse_windowdraggin = true;
        background_color = "rgb(000000)";
        middle_click_paste = false;
      };

      xwayland = {
        enabled = true;
        force_zero_scaling = true;
      };

      experimental = {
        wide_color_gamut = true;
      };

      plugin = {
        borders-plus-plus = {
          add_borders = 1;
          col.border_1 = "rgb(FFFFFF)";
          col.border_2 = "rgb(2222FF)";
          border_size_1 = 10;
          border_size_2 = 5;
        };
      };

    };

  }
}