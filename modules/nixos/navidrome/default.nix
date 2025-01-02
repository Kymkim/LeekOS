{config, pkgs, lib, ... }:

{
  options = {
    system-modules.navidrome = {

      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Whether to enable Navidrome Support";
      };

    };

  };

  config = lib.mkMerge [
    (
      lib.mkIf config.system-modules.navidrome.enable {  
        systemd.services.navidrome.serviceConfig.ProtectHome = lib.mkForce "read-only";
        services.navidrome = {
          enable = true;
          settings = {
            MusicFolder = "/home/ukimnix/Archive/Media/Music";
            EnableSharing = true;
            Address = "localhost";
          };
        };
        services.nginx = {
          enable = true;
          recommendedProxySettings = true;
          recommendedTlsSettings = true;
          # other Nginx options
          virtualHosts."www.kym-kim.com" =  {
            ##enableACME = true;
            forceSSL = true;
            locations."/navidrome" = {
              proxyPass = "http://localhost:4533/";
              proxyWebsockets = true; # needed if you need to use WebSocket
              extraConfig =
                # required when the target is also TLS server with multiple hosts
                "proxy_ssl_server_name on;" +
                # required when the server wants to use HTTP Authentication
                "proxy_pass_header Authorization;"
                ;
            };
          };
      };
      }

    )
  ];
}