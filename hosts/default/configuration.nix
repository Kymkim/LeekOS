{ config, pkgs, inputs, ... }:
{
  imports = [ 
    ./hardware-configuration.nix  #DO NOT USE MINE! USE YOUR OWN HARDWARE CONFIGURATION
    ../../modules/nixos/default.nix
    inputs.home-manager.nixosModules.default
  ];

  steam.enable = true;
  printer.enable = true;
  vms.enable = true;
  thunar.enable = true;
  
  environment.systemPackages = with pkgs; [
    #Most of these will be moved once they got their own configuration settings
    #In the meantime, these are appllications I like to run on my system
    #Please comment out the ones you dont need...
    rofi-wayland  #Temporarily here. Will use EWW or AGS for app launcher down the line
    nerdfonts     #Icons as fonts
    nwg-look      #For setting GTK themes
    pwvucontrol   #GUI for PulseAudio 
    blueberry     #GUI for configuring Bluetooth Devices
    git
    vim
    wget
    curl
    firefox
    killall     
    gh                        #GitHub CLI Tool
    obsidian                  #Note taking app
    vscodium                  #Coding app
    discord                   #Chat application
    obs-studio                #Screen recording/streaming software
    zoom-us                   #Online conference calls
    unityhub                  #App for managing Unity Project and installation
    inkscape-with-extensions  #App for editing SVGs
    kdePackages.kdenlive
    bottles
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

    # Audio
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };
    
    # Bluetooth
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
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
