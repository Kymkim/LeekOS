#All modules configuration files
{ pkgs, lib, config, ... }:

{
    imports = [
        ./audio
        ./content-creation
        ./fcitx5
        ./file-manager
        ./fonts
        ./gaming
        ./homelab
        ./printer
        ./utils
        ./vm
        ./wireless
    ];

    #Here are the list of all possible system modules. All are disabled by default.
    system-modules = {
        audio.enable                = lib.mkDefault false;   # Enables audio support through PipeWire
        content-creation.enable     = lib.mkDefault false;   # Adds various content creation tools such as Darktable, OBS, and Krita
        content-creation.v4l2DSLR   = lib.mkDefault false;   # Adds DSLR cameras as Virtual Webcams
        fcitx5.enable               = lib.mkDefault false;   # Used for mozc (Japanese Keyboard Layout)
        file-manager.enable         = lib.mkDefault false;   # File manager to manage... well files.        
        fonts.enable                = lib.mkDefault false;   # Installs various fonts such as fira-code, noto, liberation, etc...
        gaming.enable               = lib.mkDefault false;   # Adds various gaming packages and softwares
        homelab.enable              = lib.mkDefault false;   # Adds "homelab" related tools such as FreeCAD and Cura
        printer.enable              = lib.mkDefault false;   # Printer support. The most tempermental device in existance - sometimes work, sometimes it does not
        utils.enable                = lib.mkDefault false;   # Useful CLI utilities
        wireless.enable             = lib.mkDefault false;   # Wireless connectivity support such as wifi and bluetooth
    };
    
}