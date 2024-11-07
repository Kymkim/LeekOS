#All modules configuration files
{ pkgs, lib, config, ... }:

{
    imports = [
        ./audio
        ./fcitx5
        ./fonts
        ./gaming
        ./printer
        ./thunar
        ./utils
        ./vm
        ./wireless
    ];
}