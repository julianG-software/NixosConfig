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

    mpv = {
      enable = lib.mkEnableOption "enables mpv module";
    };
  };

  config = lib.mkIf config.mpv.enable {
    programs.mpv = {
      enable = true;
      config = {
        pause = true;
        mute = true;
      };
    };
  };
}
