{
description = "ukimNixOS Config";

inputs = {
	nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
	home-manager.url = "github:nix-community/home-manager/master";
	home-manager.inputs.nixpkgs.follows = "nixpkgs";
	ags.url = "github:Aylur/ags";
};

outputs = { self, nixpkgs, home-manager,  ... }@inputs: 
	let
		lib = nixpkgs.lib;
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in {

		#NixOsConfigurations contains all of the applications that I need
		#In my case I have two config, one for my FrameworkLaptop16 and one for my PC
		nixosConfigurations = {
			default = lib.nixosSystem {
				inherit system;
				specialArgs = {inherit inputs;};
				modules = [
					./hosts/default/configuration.nix
				];
			};
			fw16 = lib.nixosSystem {
				inherit system;
				specialArgs = {inherit inputs;};
				modules = [
					./hosts/framework16/configuration.nix	
				];
			};
		};

		#HomeConfiguration is mainly here for configuring dotfiles. Other

		homeConfigurations = {
			default =  home-manager.lib.homeManagerConfiguration { 
				inherit pkgs;
				extraSpecialArgs = {inherit inputs;};
				modules = [
					./hosts/default/home.nix
				];
			};
		};
	};
}
