{ pkgs, lib, config, ... }:
{

  # Hyprland Configuration (Default)

  home.packages = with pkgs; [
    hyprshot
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    plugins = with pkgs.hyprlandPlugins; [
      borders-plus-plus
      hy3
    ];

    settings = {
                                 
      "$mod" = "SUPER";
      "$shiftmod" = "SUPER_SHIFT";
      "$terminal" = "kitty";
      "$launcher" = "rofi";

      bind = [

        "$mod, PRINT, exec, hyprshot -m output"
        ", PRINT, exec, hyprshot -m output"
        "$shiftmod, PRINT, exec, hyprshot -m region"

        "$mod, SPACE, exec, $launcher -show drun" 
        "$mod, T, exec, $terminal"
        "$mod, F, exec, firefox"
        "$mod, O, exec, obsidian"
        "$mod, V, exec, code"

        "$mod, ESCAPE, killactive"
        "$mod, X, togglefloating"
        "$mod, J, hy3:makegroup, h, toggle, ephermal"
        "$mod, TAB, hy3:changegroup, toggletab"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod SHIFT, 1, hy3:movetoworkspace, 1"
        "$mod SHIFT, 2, hy3:movetoworkspace, 2"
        "$mod SHIFT, 3, hy3:movetoworkspace, 3"
        "$mod SHIFT, 4, hy3:movetoworkspace, 4"
        "$mod SHIFT, 5, hy3:movetoworkspace, 5"
        "$mod SHIFT, 6, hy3:movetoworkspace, 6"
        "$mod SHIFT, 7, hy3:movetoworkspace, 7"
        "$mod SHIFT, 8, hy3:movetoworkspace, 8"
        "$mod SHIFT, 9, hy3:movetoworkspace, 9"
        "$mod SHIFT, 0, hy3:movetoworkspace, 10"
      ];

      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
      ];

      monitor = [
        "eDP-1, preferred, auto, 1.25"
      ];

      env = [
        "XCURSOR_SIZE, 48"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 5;
        resize_on_border = true;
        extend_border_grab_area = 20;
        hover_icon_on_border = true;
        layout = "hy3";
        snap = {
          enabled = true;
        };
      };

      decoration = {
        blur = {
          enabled = true;
        };
      };

      animations = {
        enabled = true;
      };

      input = {
        touchpad = {
          natural_scroll = true;
        };
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
      };

      misc = {
        disable_hyprland_logo = true;
        animate_manual_resizes = true;
        background_color = "rgb(000000)";
        middle_click_paste = false;
      };

      xwayland = {
        enabled = true;
        force_zero_scaling = true;
      };

      windowrulev2 = [
        "float, class:kitty, title:kitty"
      ];

      plugin = {
        borders-plus-plus = {
          add_borders = 1;
          col.border_1 = "rgb(FFFFFF)";
          col.border_2 = "rgb(2222FF)";
          border_size_1 = 10;
          border_size_2 = 5;
        };
#        hyprtrails = {
#          color = "rgba(e1288588)";
#        };
      };
    };
  };
}
