{
  pkgs,
  lib,
  config,
  programs,
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
  };
}
