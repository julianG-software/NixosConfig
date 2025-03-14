{
  pkgs,
  lib,
  config,
  programs,
  home,
  ...
}:
{
  imports = [
    # Paths to other modules.
    # Compose this module out of smaller ones.
  ];

  options = {
    # Option declarations.
    # Declare what settings a user of this module can set.
    # Usually this includes a global "enable" option which defaults to false.

    zsh.enable = lib.mkEnableOption "enables zsh config";
  };

  config = lib.mkIf config.zsh.enable {

    # Install ZSH Related Packages
    home.packages = with pkgs; [
      oh-my-posh
      zplug
    ];

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      #enableAutosuggestions = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history.size = 10000;

      # Plugins
      zplug = {
        enable = true;
        plugins = [ ];
      };

    };

    programs.oh-my-posh = {
      enable = true;
      enableZshIntegration = true;
      useTheme = "catppuccin_frappe";
    };
  };
}
