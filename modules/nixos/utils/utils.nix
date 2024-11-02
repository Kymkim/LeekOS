{ pkgs, lib, config, ... }:
{

  options = {
    utils.enable = lib.mkEnableOption "Enables Useful Utility Tools";
  };

  config = lib.mkIf config.utils.enable {  
    
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