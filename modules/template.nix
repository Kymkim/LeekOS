{ pkgs, lib, config, ... }:
{

  options = {
    system-modules.template.enable = lib.mkEnableOption "Enables Template";
  };

  config = lib.mkIf config.system-modules.template.enable {  
    
  };

}