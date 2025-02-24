{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.ukimnix = {
    initialPassword = "hatsunemiku";
    isNormalUser = true;
    description = "m3tam3re";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.ukimnix =
    import ../../../home/ukimnix/${config.networking.hostName}.nix;
}
