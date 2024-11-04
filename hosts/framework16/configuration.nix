{ config, pkgs, inputs, ... }:
{
  imports = [ 
    ./hardware-configuration.nix  #DO NOT USE MINE! USE YOUR OWN HARDWARE CONFIGURATION
    ./packages-modules.nix
    inputs.home-manager.nixosModules.default
  ];

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];


  #System Configuration:
  
    # Environment Variables
    environment.variables.EDITOR = "vim";

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking = {
      hostName = "MikuOS"; 
      networkmanager.enable = true;
    };
    
    # Bluetooth
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    # Audio
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    # Polkit
    security.polkit.enable = true;

    # Locale and Keyboard
    time.timeZone = "America/Los_Angeles";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
    console.keyMap = "us";

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.ukimnix = {
      isNormalUser = true;
      description = "Kim";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Enable flakes
    nix.settings.experimental-features = ["nix-command" "flakes"];

    # Home Manager Configuration
    home-manager = {
      extraSpecialArgs = {inherit inputs;};
      users = {
        "ukimnix" = import ./home.nix;
      };
      backupFileExtension = "backup";
    };

    # No touchie
    system.stateVersion = "24.05";

}
