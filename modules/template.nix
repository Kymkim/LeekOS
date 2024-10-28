{ pkgs, lib, config, ... }:

  # ░░      ░░░        ░░        ░░░      ░░░  ░░░░  ░
  # ▒  ▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒   ▒▒   ▒
  # ▓▓      ▓▓▓▓▓▓  ▓▓▓▓▓      ▓▓▓▓  ▓▓▓▓  ▓▓        ▓
  # ███████  █████  █████  ████████        ██  █  █  █
  # ██      ██████  █████        ██  ████  ██  ████  █
                                                  
  ###################################################################################
  # "Steam is the ultimate destination for playing, discussing, and creating games" #
  # (That's what their website says..).                                             #
  #                                                                                 #
  # Website: https://store.steampowered.com/                                        #
  ###################################################################################

{

  options = {
    template.enable = lib.mkEnableOption "Enables Template";
  };

  config = lib.mkIf config.template.enable {  

  };

}