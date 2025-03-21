{ pkgs, lib, config, ... }:

  # ░        ░░        ░░       ░░░  ░░░░  ░░        ░░   ░░░  ░░░      ░░░  ░░░░░░░
  # ▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒   ▒▒   ▒▒▒▒▒  ▒▒▒▒▒    ▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒
  # ▓▓▓▓  ▓▓▓▓▓      ▓▓▓▓       ▓▓▓        ▓▓▓▓▓  ▓▓▓▓▓  ▓  ▓  ▓▓  ▓▓▓▓  ▓▓  ▓▓▓▓▓▓▓
  # ████  █████  ████████  ███  ███  █  █  █████  █████  ██    ██        ██  ███████
  # ████  █████        ██  ████  ██  ████  ██        ██  ███   ██  ████  ██        █
                                                                                
                                                  
                                                  
  ####################################################
  # I use kitty with starship and zsh as my terminal #
  #                                                  #  
  # Kitty: https://sw.kovidgoyal.net/kitty/          #
  # Starship: https://starship.rs/                   #
  # Zsh: https://www.zsh.org/                        #
  ####################################################

{

    programs.zsh = {
      enable = true; 
    };
    programs.starship =  {
      enable = true;
      enableZshIntegration = true;
      #Taken from 
      settings = {
        format = lib.concatStrings [
          "[░▒▓](#e12885)"
          "[ 󱄅 ](bg:#e12885 fg:#090c0c)"
          "[](bg:#86cecb fg:#e12885)"
          "$directory"
          "[](fg:#86cecb bg:#137a7f)"
          "$git_branch"
          "$git_status"
          "[](fg:#137a7f bg:#213336)"
          "$nodejs"
          "$rust"
          "$golang"
          "$php"
          "[](fg:#213336 bg:#1d2d30)"
          "$time"
          "[ ](fg:#1d2d30)"
          "\n$character"
        ];

        directory = {
          style = "fg:#e3e5e5 bg:#86cecb";
          format = "[ $path ]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";
          substitutions = {
            "Documents" = "󰈙 ";
            "Downloads" = " ";
            "Music" = " ";
            "Pictures" = " ";
          };
        };
        
        git_branch = {
          symbol = "";
          style = "bg:#137a7f";
          format = "[[ $symbol $branch ](fg:#86cecb bg:#137a7f)]($style)";
        };

        git_status = {
          style = "bg:#137a7f";
          format = "[[($all_status$ahead_behind )](fg:#86cecb bg:#137a7f)]($style)";
        };
        

        nodejs = {
          symbol = "";
          style = "bg:#213336";
          format = "[[ $symbol ($version) ](fg:#86cecb bg:#213336)]($style)";
        };


        rust = {
          symbol = "";
          style = "bg:#213336";
          format = "[[ $symbol ($version) ](fg:#86cecb bg:#213336)]($style)";
        };

        golang = {
          symbol = "";
          style = "bg:#213336";
          format = "[[ $symbol ($version) ](fg:#86cecb bg:#213336)]($style)";
        };
        
        php = {
          symbol = "";
          style = "bg:#213336";
          format = "[[ $symbol ($version) ](fg:#86cecb bg:#213336)]($style)";
        };

        time = {
          disabled = false;
          time_format = "%R"; # Hour:Minute Format
          style = "bg:#1d2d30";
          format = "[[  $time ](fg:#a0a9cb bg:#1d2d30)]($style)";
        };
      };
    };
    programs.kitty = {
      enable = true;
      shellIntegration.mode = "enabled";

      shellIntegration.enableZshIntegration = true;

      settings = {
        window_padding_width = 20;
        background_opacity = 0.8;
        shell = "zsh";
        font_size = 13.5;
      };

    };
}