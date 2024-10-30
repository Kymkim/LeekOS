#All modules configuration files
{ pkgs, lib, config, ... }:

{
    imports = [
        ./steam/steam.nix
        ./printing/printer.nix
    ];
    
}