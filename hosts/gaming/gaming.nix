#------------------------------------------------------------#
#                         Gaming                             #
#------------------------------------------------------------#
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
    gaming = {
      enable = lib.mkEnableOption "enables Gaming module";
      GPU_Drivers = lib.mkOption {
        type = lib.types.listOf (
          lib.types.enum [
            "nvidia"
            "amdgpu"
          ]
        );
        default = [ "nvidia" ];
        description = "sets the gpu drivers to be used";
      };
    };
  };

  config = lib.mkIf config.gaming.enable {
    environment.systemPackages = with pkgs; [
      mangohud
      protonup
    ];

    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };

    #enable opengl
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    # GPU Drivers
    services.xserver.videoDrivers = config.gaming.GPU_Drivers; # worls for x and wayland
    #services.xserver.videoDrivers = ["amdgpu"];

    hardware.nvidia.modesetting.enable = true; # helps some wayland compositors work porperly
    hardware.nvidia.open = true; # enables the nvidia open source kernal modules;

    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;
    programs.gamemode.enable = true;
  };
}
