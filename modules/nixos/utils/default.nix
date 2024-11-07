{ pkgs, lib, config, ... }:
{

  options = {
    system-modules.utils.enable = lib.mkEnableOption "Enables Useful Utility Tools";
  };

  config = lib.mkIf config.system-modules.utils.enable {  
    
    programs = {
      #CLI Utilities
      git = {
        enable = true;
      };
      neovim = {
        enable = true;
        withPython3 = true;
      };
    };

  };

}