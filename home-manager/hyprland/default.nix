{ pkgs, lib, config, ... }:
{

    wayland.windowManager.hyprland.enable = true;
    wayland.windowManager.hyprland.xwayland.enable = true;
    wayland.windowManager.hyprland.settings = {

      #Monitor Setting
      monitor = "eDP-1, preferred, auto, 1.25";
      xwayland = {
        force_zero_scaling = true;
      };

      #Auto-Starts
      exec-once = [
        "ags"
        "lxqt-policykit-agent"
        "ags run"
      ];

      #Input Related Configuration
      input = {
        touchpad = {
          natural_scroll = true;
          drag_lock = true;
        };
      };
      gestures = {
        workspace_swipe = true;
      };  
      cursor = {
        enable_hyprcursor = true; #TODO: add hypercursor
      };

      #Keybindings                                      
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$launcher" = "rofi";

      bind = [
        "$mod, ESCAPE, killactive"
        "$mod, SPACE, exec, $launcher -show drun" 
        "$mod, T, exec, $terminal"
        "$mod, F, exec, firefox"
        "$mod, O, exec, obsidian"
        
        "$mod, X, togglefloating"

        #Workspaces 
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
        ", code:191, workspace, r-1"

      ];

      #Mousebinds
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        #"$mod, mouse:276, workspace, next"
        #"$mod, mouse:275, workspace, previous"
      ];

      general = {
        border_size = 0;
        gaps_in = 5;
        gaps_out = 10;
      };

      decoration = {
        rounding = 0;
      };

      windowrule = [
        "float, ^(kitty)$"
      ];

      windowrulev2 = [
        "float, title:DesktopMate"
        "noblur, title:DesktopMate"
        "nofocus, title:DesktopMate"
        "noshadow, title:DesktopMate"
        "noborder, title:DesktopMate"
      ];

      misc = {
        disable_splash_rendering = true;
        disable_hyprland_logo = true;
      };                                                    
    };
}