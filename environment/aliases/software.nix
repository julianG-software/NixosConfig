{
  pkgs,
  lib,
  config,
  programs,
  ...
}:
{
  imports = [

  ];

  options = {

    software_aliases = {
      enable = lib.mkEnableOption "enables software_aliases module";

      vim = {
        nixCats.enable = lib.mkEnableOption "enable nixCats aliases";
      };

    };
  };

  config = lib.mkIf config.software_aliases.enable {

    #environment.shellAliases
    programs.zsh.shellAliases =
      {
        # General software aliases
      }
      // (lib.mkIf config.software_aliases.vim.nixCats.enable {
        # nixCats
        vi = "nixCats";
        vim = "nixCats";
      });
  };
}
