# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  lib,
  programs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default

    # Import my Shell Module
    ../../modules/programs/shells.nix
    #../../modules/programs/nvf.nix
    ../../modules/services/RDP.nix
    ../../modules/services/ssh/ssh.nix
    ../../modules/services/GDM_auto-suspend.nix
    ../../environment/aliases.nix
    ../../environment/variables.nix
    ../../modules/services/sunshine.nix
    ./gaming.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # fstab
  fileSystems."/home/ulianj/.mnt/external" = {
    device = "/dev/disk/by-uuid/c1c8c743-4e6f-41d5-9116-dc8dae93fb6c";
    fsType = "ext4";
  };

  networking.hostName = "nixos-gaming"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  #services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;

  # Disable the Gnome3/GDM auto-suspend feature that cannot be disabled in GUI!
  # If no user is logged in, the machine will power down after 20 minutes
  #GDM_auto-suspend.enable = false;

  services.desktopManager.plasma6.enable = true;

  services.displayManager.sddm.enable = true;

  services.displayManager.sddm.wayland.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "de-latin1-nodeadkeys";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  #hardware.pulseaudio.enable = false; # option renamed
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ulianj = {
    isNormalUser = true;
    description = "ulianJ";
    extraGroups = [
      "networkmanager"
      "wheel"
      "gamemode"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  # automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = { inherit inputs; };
    users = {
      "ulianj" = import ./home.nix;
    };
  };
  # Flatpak settings
  services.flatpak.enable = true;
  # Add a new remote. Keep the default one (flathub)
  services.flatpak.remotes = lib.mkOptionDefault [
    {
      name = "flathub-beta";
      location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    }
  ];

  services.flatpak.update.auto.enable = true;
  services.flatpak.update.onActivation = true;
  services.flatpak.uninstallUnmanaged = true; # uninstall not declared flatpak's automaticly

  # Add here the flatpaks you want to install
  services.flatpak.packages = [
    #{ appId = "com.brave.Browser"; origin = "flathub"; }
    #"com.obsproject.Studio"
    #"im.riot.Riot"
    "com.discordapp.Discord"
  ];

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  hardware.bluetooth.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ethtool
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    gh
    arandr
    mpv
    nixfmt-rfc-style
    inputs.nixCats.packages.${system}.nixCats
    hwinfo
    dmidecode
    flameshot

    mullvad-vpn
    qbittorrent-enhanced

    #thumbnailers
    ffmpeg-headless
    ffmpegthumbnailer

    # KDE
    kdePackages.discover # Optional: Install if you use Flatpak or fwupd firmware update sevice
    kdePackages.kcalc # Calculator
    kdePackages.kcharselect # Tool to select and copy special characters from all installed fonts
    kdePackages.kclock # Clock app
    kdePackages.kcolorchooser # A small utility to select a color
    kdePackages.kolourpaint # Easy-to-use paint program
    kdePackages.ksystemlog # KDE SystemLog Application
    kdePackages.sddm-kcm # Configuration module for SDDM
    kdePackages.powerdevil # KDE power management
    kdePackages.bluedevil # Bluetooth management
    kdiff3 # Compares and merges 2 or 3 files or directories
    # Non-KDE graphical packages
    wayland-utils # Wayland utilities
    wl-clipboard # Command-line copy/paste utilities for Wayland
  ];

  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Firewall settings.
  networking.firewall = {
    allowedTCPPortRanges = [
      # Common Dev server ports
      {
        from = 3000;
        to = 4000;
      }
    ];
    # Common Tool Ports
    allowedTCPPorts = [
      8080
      5000
      4200
      9229
      5432
      3306
      5000
      2375
      9000
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  #------------------------------------------------------------#
  #                         Custom                             #
  #------------------------------------------------------------#

  # Prevent the System form Suspending when the Lid is Closed and the system is connected to external power
  services.logind.lidSwitchExternalPower = "ignore";

  # RDP

  RDP.enable = true;
  sunshine.enable = false;

  # SSH

  ssh.enable = true;
  ssh.AllowPasswordLogin = true;
  ssh.ForwardXServer = false;
  ssh.AllowRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"

  # aliases
  commonAliases.enable = true;
  software_aliases.enable = true;

  software_aliases = {
    # Enable nixcats aliases
    vim.nixCats.enable = true;
  };

  # ENV variables
  commonVariables.enable = true;

  # NVF
  # Disabld for testing NixCats
  #nvf.enable = true;

  #------------------------------------------------------------#
  #                         Gaming                             #
  #------------------------------------------------------------#

  # Enable the Gaming Module
  gaming.enable = true;
  gaming.GPU_Drivers = [ "nvidia" ]; # nvidia or amdgpu
}
