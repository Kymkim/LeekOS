{ config, lib, inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
      (wrapOBS {
        plugins = with obs-studio-plugins; [
          wlrobs
          obs-backgroundremoval
          obs-pipewire-audio-capture
        ];
      })
  ];
}