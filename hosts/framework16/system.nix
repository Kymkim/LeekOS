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

  # System modules activation. Deactivate if not needed.
  system-modules = {
    audio.enable      = true;   # Enables audio support through PipeWire
    fcitx5.enable     = true;   # Used for mozc (Japanese Keyboard Layout)
    fonts.enable      = true;   # Installs various fonts such as fira-code, noto, liberation, etc...
    gaming.enable     = false;  # Disables various gaming packages and softwares
    printer.enable    = true;   # Printer support. The most tempermental device in existance - sometimes work, sometimes it does not
    thunar.enable     = true;   # File manager to manage... well files.
    utils.enable      = true;   # Useful CLI utilities
    vm.enable         = true;   # Enables virtual machine support with Virtio support  
    wireless.enable   = true;   # Wireless connectivity support such as wifi and bluetooth
  };

  # ▗▄▄▖  ▗▄▖  ▗▄▄▖▗▖ ▗▖ ▗▄▖  ▗▄▄▖▗▄▄▄▖ ▗▄▄▖
  # ▐▌ ▐▌▐▌ ▐▌▐▌   ▐▌▗▞▘▐▌ ▐▌▐▌   ▐▌   ▐▌   
  # ▐▛▀▘ ▐▛▀▜▌▐▌   ▐▛▚▖ ▐▛▀▜▌▐▌▝▜▌▐▛▀▀▘ ▝▀▚▖
  # ▐▌   ▐▌ ▐▌▝▚▄▄▖▐▌ ▐▌▐▌ ▐▌▝▚▄▞▘▐▙▄▄▖▗▄▄▞▘

  # Additional packages if needed
  environment.systemPackages = [

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

  # No touchie
  system.stateVersion = "24.05";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

}
