{ pkgs, config, lib, ... }:
{
  options = {
    system-modules.fonts.enable = lib.mkEnableOption "Enables various fonts";
  };

  config = lib.mkIf config.system-modules.fonts.enable {  
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
    ];
  };
}