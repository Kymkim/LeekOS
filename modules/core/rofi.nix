{ pkgs, ... }:
{
	environment.systemPackages = [
		pkgs.rofi-wayland
	];
}
