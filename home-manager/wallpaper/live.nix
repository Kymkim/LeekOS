{ pkgs, lib, config, ... }:
{

    home.packages = with pkgs; [
        linux-wallpaperengine
    ];

    #This Requires Wallpaper Engine to be installed on Steam. Otherwise it would not work.

    # Wallpapers
    # 3286568347
    # 2519362154
    # 3418711234
    # 3260949785
    # 2279368349
    # 2847166295
    # 1897258907
    # 1897258907
    # 2001590448


    wayland.windowManager.hyprland.extraConfig = ''
        exec-once = linux-wallpaperengine --clamp border --silent --scaling fill --fps 30 --screen-root eDP-1 2001590448
    '';

}
