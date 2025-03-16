{
  pkgs,
  lib,
  config,
  services,
  ...
}:
{
  imports = [ ];

  options = {
    RDP.enable = lib.mkEnableOption "enables RDP module";
  };

  config = lib.mkIf config.RDP.enable {
    services.xrdp.enable = true;
    services.xrdp.defaultWindowManager = "${pkgs.gnome-session}/bin/gnome-session";
    services.xrdp.openFirewall = true;
  };
}
