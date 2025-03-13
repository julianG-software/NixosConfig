{
  pkgs,
  lib,
  config,
  programs,
  ...
}:
{
  imports = [
    # Paths to other modules.
    # Compose this module out of smaller ones.
    ../../../environment/aliases/commonAliases.nix
  ];

  options = {
    # Option declarations.
    # Declare what settings a user of this module can set.
    # Usually this includes a global "enable" option which defaults to false.

    zsh.enable = lib.mkEnableOption "enables zsh shell";
  };

  config = lib.mkIf config.zsh.enable {
    # Option definitions.
    # Define what other settings, services and resources should be active.
    # Usually these depend on whether a user of this module chose to "enable" it
    # using the "option" above.
    # Options for modules imported in "imports" can be set here.

    # enable the shell system wide
    programs.zsh.enable = true;
    commonAliases.enable = true;
  };
}
