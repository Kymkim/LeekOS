{
  description = "ukimNixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.workstation = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/default/configuration.nix
        ./modules/core/hyprland.nix
	./modules/core/rofi.nix
	./modules/app/obsidian.nix	     
	./modules/app/vscodium.nix
	./modules/app/discord.nix
	./modules/app/obs-studio.nix
#	./modules/app/bitwarden.nix #Bitwarden seems to unable to compile in the unstable channel
      ];
    };
  };
}
