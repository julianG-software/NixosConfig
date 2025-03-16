{
  pkgs,
  lib,
  config,
  services,
  ...
}:
{
  imports = [

  ];

  options = {

    ssh = {
      enable = lib.mkEnableOption "enables ssh module";
      AllowPasswordLogin = lib.mkOption {
        type = lib.types.nullOr lib.types.bool;
        default = true;
        description = ''
            		Specifies whether password authentication is allowed.
          		'';
      };
      AllowRootLogin = lib.mkOption {
        default = "prohibit-password";
        type = lib.types.nullOr (
          lib.types.enum [
            "yes"
            "without-password"
            "prohibit-password"
            "forced-commands-only"
            "no"
          ]
        );
        description = ''
          Whether the root user can login using ssh.
        '';
      };
      AllowedUsers = lib.mkOption {
        type = with lib.types; nullOr (listOf str);
        default = null;
        description = ''
          If specified, login is allowed only for the listed users.
          See {manpage}`sshd_config(5)` for details.
        '';
      };
      ForwardXServer = lib.mkOption {
        type = lib.types.nullOr lib.types.bool;
        default = false;
        description = ''
          Whether to allow X11 connections to be forwarded.
        '';
      };
    };
  };
  config = lib.mkIf config.ssh.enable {
    services.openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = config.ssh.AllowPasswordLogin;
        AllowUsers = config.ssh.AllowedUsers;
        UseDns = true;
        X11Forwarding = config.ssh.ForwardXServer;
        PermitRootLogin = config.ssh.AllowRootLogin;
      };
    };
  };
}
