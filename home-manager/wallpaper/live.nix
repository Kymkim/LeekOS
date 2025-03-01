{ pkgs, lib, config, ... }:
{

    home.packages = with pkgs; [
        linux-wallpaperengine
    ];

    #This Requires Wallpaper Engine to be installed on Steam. Otherwise it would not work.

    # Wallpapers
    # 3286568347
    # 3000925581
    # https://steamcommunity.com/sharedfiles/filedetails/?id=3420277613
    # https://steamcommunity.com/sharedfiles/filedetails/?id=3415297400
    # https://steamcommunity.com/sharedfiles/filedetails/?id=3175116100
    # https://steamcommunity.com/sharedfiles/filedetails/?id=3280544405
    # https://steamcommunity.com/sharedfiles/filedetails/?id=3362997197
    # https://steamcommunity.com/sharedfiles/filedetails/?id=3005028837
    # https://steamcommunity.com/sharedfiles/filedetails/?id=2001590448
    # https://steamcommunity.com/sharedfiles/filedetails/?id=3409595232
    # https://steamcommunity.com/sharedfiles/filedetails/?id=1975040478
    # https://steamcommunity.com/sharedfiles/filedetails/?id=2980418907
    # https://steamcommunity.com/sharedfiles/filedetails/?id=3147649408
    # https://steamcommunity.com/sharedfiles/filedetails/?id=3320615440
    # https://steamcommunity.com/sharedfiles/filedetails/?id=3270966218
    # https://steamcommunity.com/sharedfiles/filedetails/?id=3400235423

    # https://steamcommunity.com/sharedfiles/filedetails/?id=2519362154
    # https://steamcommunity.com/sharedfiles/filedetails/?id=3061119563
    # https://steamcommunity.com/sharedfiles/filedetails/?id=3418711234
    # https://steamcommunity.com/sharedfiles/filedetails/?id=3260949785
    # https://steamcommunity.com/sharedfiles/filedetails/?id=2279368349


    wayland.windowManager.hyprland.extraConfig = ''
        exec-once = linux-wallpaperengine --clamp border --silent --scaling fill --fps 30 --screen-root eDP-1 2519362154
    '';

}
