{ config, pkgs, inputs, ... }:

{

  imports = [ 
    ./hardware-configuration.nix  #DO NOT USE MINE! USE YOUR OWN HARDWARE CONFIGURATION
    ../../modules/nixos
    inputs.home-manager.nixosModules.default
  ];



  #Framework16 Specific Stuff
  boot.kernelParams = [ "amdgpu.abmlevel=0" ];
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="32ac", ATTRS{idProduct}=="0012", ATTR{power/wakeup}="disabled", ATTR{driver/1-1.1.1.4/power/wakeup}="disabled"
    SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="32ac", ATTRS{idProduct}=="0014", ATTR{power/wakeup}="disabled", ATTR{driver/1-1.1.1.4/power/wakeup}="disabled"
  '';

  # Additional packages if needed
  environment.systemPackages = with pkgs; [
    gh
    git
    file-roller
  ];
  
  services.tailscale.enable = true; 
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

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

  #Networking
  networking.networkmanager.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ukimnix = {
    isNormalUser = true;
    initialPassword = "HatsuneMiku";
    description = "Kim";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  # Enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Home Manager Configuration
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "ukimnix" = import ../../home-manager/users/ukimnix.nix;
    };
  };

  #Hyprland
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
    useOSProber = true;
  };

  networking.hostName = "LeekOS-Framework16";

  # Automatic garbage collection. And some optimization
  nix = {
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  #Thunar
  programs.xfconf.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };

  #Fingerprint and power management
  services.fprintd.enable = true;
  services.power-profiles-daemon.enable = true;

}
