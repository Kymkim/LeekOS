#All modules configuration files
{ pkgs, lib, config, ... }:

{
    imports = [
        ./steam/steam.nix
        ./printing/printer.nix
        ./fcitx5/fcitx5.nix
        ./virt/virt.nix
    ];
    
}