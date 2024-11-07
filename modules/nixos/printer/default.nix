{ pkgs, lib, config, ... }:
{

  options = {
    system-modules.printer.enable = lib.mkEnableOption "Enables Printing Services";
  };

  config = lib.mkIf config.system-modules.printer.enable {  
    services.printing.enable = true;
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };

}