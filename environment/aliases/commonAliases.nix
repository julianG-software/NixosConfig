{
  pkgs,
  lib,
  config,
  environment,
  ...
}:
{
  imports = [
    # Paths to other modules.
    # Compose this module out of smaller ones.
  ];

  options = {
    # Option declarations.
    # Declare what settings a user of this module can set.
    # Usually this includes a global "enable" option which defaults to false.

    commonAliases.enable = lib.mkEnableOption "enables Common Aliases shell";
  };

  config = lib.mkIf config.commonAliases.enable {
    environment.shellAliases = {
      # LS
      la = "ls -al";
      ll = "ls -l";

      # CD Locations
      nixconf = "cd ~/.config/nixos/";

      # Nixos
      rebuild = "sudo nixos-rebuild switch --flake ./";
      rebuild-test = "sudo nixos-rebuild test --flake ./";
    };
  };
}
