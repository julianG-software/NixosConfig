{
  config,
  lib,
  environment,
  ...
}:
{
  imports = [
  ];

  options = {
    commonVariables.enable = lib.mkEnableOption "enables some common Enviroment Variables";
  };

  config = lib.mkIf config.commonVariables.enable {
    environment.variables = {
      # EDITOR = "vim";
      EDITOR = "nixCats";
    };
  };
}
