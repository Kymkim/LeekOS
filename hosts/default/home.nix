{ config, pkgs, ... }:

{

  home.username = "ukimnix";
  home.homeDirectory = "/home/ukimnix";

  home.stateVersion = "24.05";

  nixpkgs.config.allowUnfree = true;

  # ░░      ░░░       ░░░       ░░░░      ░░
  # ▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒
  # ▓  ▓▓▓▓  ▓▓       ▓▓▓       ▓▓▓▓      ▓▓
  # █        ██  ████████  ██████████████  █
  # █  ████  ██  ████████  █████████      ██

  ########################################################                                      
  # Applications for my workstation.                     #
  #Of course, feel free to remove if you dont need these #
  ########################################################

  home.packages = with pkgs; [
	  obsidian    #Note taking app
    vscodium    #Coding app
    discord     #Chat application
    obs-studio  #Screen recording/streaming software
    zoom-us     #Online conference calls
    unityhub    #App for managing Unity Project and installation
#   bitwarden   #Password manager: Bitwarden does not want to compile lately. No clue why...
  ];

  # ░  ░░░░  ░░  ░░░░  ░░       ░░░       ░░░  ░░░░░░░░░      ░░░   ░░░  ░░       ░░
  # ▒  ▒▒▒▒  ▒▒▒  ▒▒  ▒▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒    ▒▒  ▒▒  ▒▒▒▒  ▒
  # ▓        ▓▓▓▓    ▓▓▓▓       ▓▓▓       ▓▓▓  ▓▓▓▓▓▓▓▓  ▓▓▓▓  ▓▓  ▓  ▓  ▓▓  ▓▓▓▓  ▓
  # █  ████  █████  █████  ████████  ███  ███  ████████        ██  ██    ██  ████  █
  # █  ████  █████  █████  ████████  ████  ██        ██  ████  ██  ███   ██       ██
                                                                                
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {

      #  _  __          _     _           _     
      # | |/ /___ _   _| |__ (_)_ __   __| |___ 
      # | ' // _ \ | | | '_ \| | '_ \ / _` / __|
      # | . \  __/ |_| | |_) | | | | | (_| \__ \
      # |_|\_\___|\__, |_.__/|_|_| |_|\__,_|___/
      #           |___/                         

      ###################################################################
      # My keybinds for my computer are based off ortholinear keyboard  #
      # such as the Work Louder Keyboard so it might not make sense for #
      # you. Feel free to reconfigure                                   #
      ###################################################################

      "$mod" = "SUPER";
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

      #  ____  _         _      
      # / ___|| |_ _   _| | ___ 
      # \___ \| __| | | | |/ _ \
      #  ___) | |_| |_| | |  __/
      # |____/ \__|\__, |_|\___|
      #            |___/        

      ######################################################
      # Design stuff, such as border styles and animations #
      ######################################################

      general = {
        border_size = 3;
        gaps_in = 5;
        gaps_out = 20;
        "col.active_border" = "rgba(2cf5f5ff) rgba(e12885ee) 45deg";
        "col.inactive_border" = "rgba(86cecb55)";
      };

      decoration = {
        rounding = 5;
        "col.shadow" = "rgba(e1288555)";
        "col.shadow_inactive" = "rgba(FFFFFF00)";
        drop_shadow = true;
        shadow_range = 10;
        shadow_render_power = 3;
      };

    };

  programs.home-manager.enable = true;
}
