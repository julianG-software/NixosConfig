{
  pkgs,
  lib,
  config,
  systemd,
  ...
}:
{
  imports = [

  ];

  options = {

    GDM_auto-suspend.enable = lib.mkEnableOption "enables GDM_auto-suspend module";
  };

  config = lib.mkIf config.GDM_auto-suspend.enable {
    systemd.targets.sleep.enable = false;
    systemd.targets.suspend.enable = false;
    systemd.targets.hibernate.enable = false;
    systemd.targets.hybrid-sleep.enable = false;

  };
}
