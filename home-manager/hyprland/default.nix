{ pkgs, lib, config, ... }:
{

  # Hyprland Configuration (Default)
  # Color Scheme:
  #  - Background: #1D2B53tptt
  #  - Foreground: #FFFFFF
  #  - Primary Accent: #2AADFF
  #  - Secondary Accent: #FF77A8
  #  - Tertiary Accent: #c7ede4

  home.packages = with pkgs; [
    xorg.xev #For keybind codes
    quintom-cursor-theme
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
                   
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$launcher" = "rofi";
      "$browser" = "zen";

      bindm = [
        "$mod, mouse:272, movewindow"
      ];

      exec-once = [
        "waybar"
        "wluma"
      ];

      bind = 
      [
        #Window Shortcuts
        "$mod, SPACE, exec, $launcher -show drun" 
        "$mod, ESCAPE, killactive"
        "$mod SHIFT, ESCAPE, forcekillactive"
        "$mod, Z, togglefloating"
        "$mod, X, fullscreen"
        "$mod, C, pin"
        "ALT, TAB, cyclenext"
        "$mod, code:49, exec, pkill waybar || waybar"

      
        #App Shortcuts
        "$mod, RETURN, exec, $terminal"
        "$mod, B, exec, $browser"
        "$mod, O, exec, obsidian"
        "$mod, V, exec, code"

        
        "$mod, TAB, togglespecialworkspace, board"
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
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ",XF86MonBrightnessUp, exec, brightnessctl s +10%"
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
      bindl = [
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioPrev, exec, playerctl previous"
        ",XF86AudioNext, exec, playerctl next"
      ];

      monitor = [
        "eDP-1, preferred, auto, 1"
        "DP-2, preferred, auto, 1"
      ];

      env = [
        "XCURSOR_SIZE, 32"
        "HYPRCURSOR_THEME,Quintom_Ink"
        "HYPRCURSOR_SIZE,24"
        "QT_CURSORSIZE, 32"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 0;
        resize_on_border = true;
        hover_icon_on_border = true;
        snap = {
          enabled = true;
        };
      };

      decoration = {
        rounding = 10;
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
      };

      misc = {
        disable_hyprland_logo = true;
        animate_manual_resizes = true;
        background_color = "rgb(000000)";
        middle_click_paste = false;
      };

      windowrulev2 = [
        "float, class:kitty, title:kitty"
      ];

      "workspace" = [
        "special:board, gapsin:0, gapsout:0, rounding:0"
      ];
    };
  };
}
