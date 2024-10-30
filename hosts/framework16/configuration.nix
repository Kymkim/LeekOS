{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/nixos/default.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "MikuOS"; 

  # Enable networking
  networking.networkmanager.enable = true;
  
  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  #Polkit
  security.polkit.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ukimnix = {
    isNormalUser = true;
    description = "Kim";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "ukimnix" = import ./home.nix;
    };
    backupFileExtension = "backup";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  #Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # ░░      ░░░       ░░░       ░░░░      ░░
  # ▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒
  # ▓  ▓▓▓▓  ▓▓       ▓▓▓       ▓▓▓▓      ▓▓
  # █        ██  ████████  ██████████████  █
  # █  ████  ██  ████████  █████████      ██

  #########################################################                                      
  # Applications. I dont really see a point               #
  # on having these on the home.nix. I only have one      #
  # user on my PC which is me...                          #
  # Of course, feel free to remove if you dont need these #
  #########################################################

  steam.enable = true;
  printer.enable = true;
  fcitx5.enable = true;
  vms.enable = true;
  thunar.enable = true;

  environment.systemPackages = with pkgs; [
    
    #Will move all of these as a separate .nix for modularity later
    #You need these for sure   
    rofi-wayland  #Temporarily here. Will use EWW or AGS for app launcher down the line
    nerdfonts     #Icons as fonts
    pywal         #For getting screen colors
    nwg-look      #For setting GTK themes
    pavucontrol   #GUI for PulseAudio 
    blueberry     #GUI for configuring Bluetooth Devices

    #Generally good to have in your system
    git
    vim
    wget
    curl
    firefox
    killall
    python312
    python312Packages.dbus-python     

    #Optional. Comment these out if not needed
    gh                        #GitHub CLI Tool
    obsidian                  #Note taking app
    vscodium                  #Coding app
    discord                   #Chat application
    obs-studio                #Screen recording/streaming software
    zoom-us                   #Online conference calls
    unityhub                  #App for managing Unity Project and installation
    inkscape-with-extensions  #App for editing SVGs
    

  ];



  environment.variables.EDITOR = "vim";

  system.stateVersion = "24.05";

}
