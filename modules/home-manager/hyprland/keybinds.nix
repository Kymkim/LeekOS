{ config, ... }:
{
  wayland.windowManager.hyprland.settings = {
      "$mod" = "SUPER";

      ###################################################################
      # My keybinds for my computer are based off ortholinear keyboard  #
      # such as the Work Louder Keyboard so it might not make sense for #
      # you. Feel free to reconfigure                                   #
      ###################################################################

      bind =
        [
          #Special Keys
          "$mod, ESCAPE, killactive"
          "$mod, SPACE, exec, rofi -show drun"

          ##################################################################
          # Left Hand - Common Apps and Functional Shortcuts               #
          # Q       W             E         R         T=terminal(kitty)    #
          # A       S             D=discord F=firefox G                    #
          # Z=float X=fullscreen  C         V=codiun  B                    #
          ##################################################################
          "$mod, T, exec, kitty"
          "$mod, D, exec, discord"
          "$mod, F, exec, firefox"
          "$mod, Z, togglefloating"
          "$mod, X, fullscreen"
          "$mod, V, exec, codium"

          ##########################################################
          # Right Hand - App Shortcuts                             #
          # Y      U      I     O         P                        #
          # H      J      K     L         '                        #
          # N      M      ,     .         /                        #
          ##########################################################
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList (i:
              let ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );
      
      #Mousebinds
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
}