{
description = "ukimNixOS Config";

inputs = {
	nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
	home-manager.url = "github:nix-community/home-manager/master";
	home-manager.inputs.nixpkgs.follows = "nixpkgs";
	nixos-hardware.url = "github:NixOS/nixos-hardware/master";
};

outputs = { self, nixpkgs, home-manager, ... }@inputs: 
	let
		lib = nixpkgs.lib;
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in {
		nixosConfigurations = {
			default = lib.nixosSystem {
				inherit system;
				specialArgs = {inherit inputs;};
				modules = [
					./hosts/default/configuration.nix
					inputs.home-manager.nixosModules.default
				];
			};
			fw16 = lib.nixosSystem {
				inherit system;
				specialArgs = {inherit inputs;};
				modules = [
					./hosts/framework16/configuration.nix
					inputs.home-manager.nixosModules.default
					inputs.nixos-hardware.nixosModules.framework-16-7040-amd
				];
			};
		};
	};

	#Is it Miku Flow Chart
	#
	#twin tails?
	# |     |
	# yes   no
	# |     |
	# |     not miku.
	# |
	# is it blue?
	# |     |
	# yes   no
	# |     |
	# its miku regardless.
}
