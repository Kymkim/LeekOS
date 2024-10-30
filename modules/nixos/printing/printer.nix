{ pkgs, lib, config, ... }:
{

  options = {
    printer.enable = lib.mkEnableOption "Enables Printing Services";
  };

  config = lib.mkIf config.printer.enable {  
    services.printing.enable = true;
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };

}