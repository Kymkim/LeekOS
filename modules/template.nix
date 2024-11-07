{ pkgs, lib, config, ... }:
{

  options = {
    template.enable = lib.mkEnableOption "Enables Template";
  };

  config = lib.mkIf config.template.enable {  
    
  };

}