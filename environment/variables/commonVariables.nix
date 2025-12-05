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
      WEBKIT_DISABLE_COMPOSITING_MODE=1; #Needed to get certain Electron Apps to work under wayland
      QT_QPA_PLATFORM="xcb"; # Needed to Get Flameshot working on wayland multi-monitor setup
    };
  };
}
