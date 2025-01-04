{ config, pkgs, inputs, ... }:

#  ▗▄▄▖▗▖  ▗▖▗▄▄▖▗▄▄▄▖▗▄▄▄▖▗▖  ▗▖     ▗▄▄▖ ▗▄▖ ▗▖  ▗▖▗▄▄▄▖▗▄▄▄▖ ▗▄▄▖
# ▐▌    ▝▚▞▘▐▌     █  ▐▌   ▐▛▚▞▜▌    ▐▌   ▐▌ ▐▌▐▛▚▖▐▌▐▌     █  ▐▌   
#  ▝▀▚▖  ▐▌  ▝▀▚▖  █  ▐▛▀▀▘▐▌  ▐▌    ▐▌   ▐▌ ▐▌▐▌ ▝▜▌▐▛▀▀▘  █  ▐▌▝▜▌
# ▗▄▄▞▘  ▐▌ ▗▄▄▞▘  █  ▐▙▄▄▖▐▌  ▐▌    ▝▚▄▄▖▝▚▄▞▘▐▌  ▐▌▐▌   ▗▄█▄▖▝▚▄▞▘

# Changes here are system-wide and not only limited to the user.

{

  imports = [ 
    ./hardware-configuration.nix  #DO NOT USE MINE! USE YOUR OWN HARDWARE CONFIGURATION
    ../../modules/nixos
    inputs.home-manager.nixosModules.default
  ];

  # ▗▖  ▗▖ ▗▄▖ ▗▄▄▄ ▗▖ ▗▖▗▖   ▗▄▄▄▖ ▗▄▄▖
  # ▐▛▚▞▜▌▐▌ ▐▌▐▌  █▐▌ ▐▌▐▌   ▐▌   ▐▌   
  # ▐▌  ▐▌▐▌ ▐▌▐▌  █▐▌ ▐▌▐▌   ▐▛▀▀▘ ▝▀▚▖
  # ▐▌  ▐▌▝▚▄▞▘▐▙▄▄▀▝▚▄▞▘▐▙▄▄▖▐▙▄▄▖▗▄▄▞▘

  # System modules activation. Deactivate if not needed. All system-modules are disabled by default. 
  # Check modules/nixos/default.nix for the list of all possible modules
  system-modules = {
    audio.enable              = true;   
    content-creation.enable   = true;
    content-creation.v4l2DSLR = true;
    fcitx5.enable             = true;   
    file-manager.enable       = true;   
    fonts.enable              = true; 
    gaming.enable             = true;
    homelab.enable            = true;  
    printer.enable            = true;  
    utils.enable              = true;   
    vm.enable                 = true;  
    vm.waydroid.enable        = true; 
    wireless.enable           = true;  
  };

  # ▗▄▄▖  ▗▄▖  ▗▄▄▖▗▖ ▗▖ ▗▄▖  ▗▄▄▖▗▄▄▄▖ ▗▄▄▖
  # ▐▌ ▐▌▐▌ ▐▌▐▌   ▐▌▗▞▘▐▌ ▐▌▐▌   ▐▌   ▐▌   
  # ▐▛▀▘ ▐▛▀▜▌▐▌   ▐▛▚▖ ▐▛▀▜▌▐▌▝▜▌▐▛▀▀▘ ▝▀▚▖
  # ▐▌   ▐▌ ▐▌▝▚▄▄▖▐▌ ▐▌▐▌ ▐▌▝▚▄▞▘▐▙▄▄▖▗▄▄▞▘

  # Additional packages if needed
  environment.systemPackages = with pkgs; [
    gh
    git
    git-lfs
    bottles
    #xdg-desktop-kde
    #xdg-desktop-portal
  ];
 
  # ▗▄▄▄▖▗▖  ▗▖▗▖  ▗▖    ▗▖  ▗▖ ▗▄▖ ▗▄▄▖ 
  # ▐▌   ▐▛▚▖▐▌▐▌  ▐▌    ▐▌  ▐▌▐▌ ▐▌▐▌ ▐▌
  # ▐▛▀▀▘▐▌ ▝▜▌▐▌  ▐▌    ▐▌  ▐▌▐▛▀▜▌▐▛▀▚▖
  # ▐▙▄▄▖▐▌  ▐▌ ▝▚▞▘      ▝▚▞▘ ▐▌ ▐▌▐▌ ▐▌
  # Additional environment variables if needed
  environment.variables = {
    EDITOR = "vim";
  };

  # Minimal system configuration. Setting locale, keyboard, enabling flakes, home-manager etc.
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
      "ukimnix" = import ./user.nix;
    };
  };

  #Hyprland so SDDM can see it
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # No touchie
  system.stateVersion = "24.05";

  # Bootloader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
  };

  # Automatic garbage collection. And some optimization
  nix = {
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  #Fingerprint and power management
  services.fprintd.enable = true;
  services.power-profiles-daemon.enable = true;

}
