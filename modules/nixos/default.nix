#All modules configuration files
{ pkgs, lib, config, ... }:

{
    imports = [
        ./steam/steam.nix
    ];

    #Everything is enabled by default
    steam.enable = lib.mkDefault true;
}