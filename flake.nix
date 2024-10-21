{
description = "ukimNixOS Config";

inputs = {
	nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
	home-manager.url = "github:nix-community/home-manager/master";
	home-manager.inputs.nixpkgs.follows = "nixpkgs";
};

outputs = { self, nixpkgs, home-manager,  ... }@inputs: {
	nixosConfigurations = {
		workstation = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = {inherit inputs;};
			modules = [
				./home-manager/home-manager.nix
				./hosts/default/configuration.nix

				./modules/core/hyprland.nix
				./modules/core/rofi.nix
				./modules/core/audio.nix
	
				./modules/app/obsidian.nix	     
				./modules/app/vscodium.nix
				./modules/app/discord.nix
				./modules/app/obs-studio.nix
#				./modules/app/bitwarden.nix #Bitwarden seems to unable to compile in the unstable channel
			];
		};
	};
	homeConfigurations = {
		default =  home-manager.lib.homeManagerConfiguration { 
			system = "x86_64-linux";
			modules = [
				./home-manager/default.nix
			];
		};
	};
};
}
