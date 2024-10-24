{ config, ... }:
{
  wayland.windowManager.hyprland.enable = true;

  import = [
    keybinds.nix
  ];
}