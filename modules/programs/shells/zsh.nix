{
  pkgs,
  lib,
  config,
  programs,
  environment,
  ...
}:
{
  imports = [
    ../../../environment/aliases/commonAliases.nix
  ];

  options = {
    zsh.enable = lib.mkEnableOption "enables zsh shell";
  };

  config = lib.mkIf config.zsh.enable {
    # enable the shell system wide
    programs.zsh.enable = true;
    commonAliases.enable = true;

    # Needed for Completion
    environment.pathsToLink = [ "/share/zsh" ];
  };
}
