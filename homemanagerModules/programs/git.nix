{
  pkgs,
  lib,
  config,
  types,
  ...
}:
{
  imports = [ ];

  options = {

    git = {
      enable = lib.mkEnableOption "enables git module";
      userName = lib.mkOption {
        type = lib.types.str;
        description = "sets the global user.name";
      };
      userEmail = lib.mkOption {
        type = lib.types.str;
        description = "sets the global user.email";
      };
    };
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = config.git.userName;
      userEmail = config.git.userEmail;
      aliases = {
        undo = "reset HEAD~";
      };
      lfs.enable = true;
    };
  };
}
