{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
  ];

  options = {

    sunshine.enable = lib.mkEnableOption "enables sunshine module";
  };

  config = lib.mkIf config.sunshine.enable {
    services.sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true;
      openFirewall = true;
    };
  };
}
