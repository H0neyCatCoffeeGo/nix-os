{ config, pkgs, callPackage, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.xremap-flake.nixosModules.default
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "Overdose"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
 
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Karachi";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
  };

  # Enable sddm.
  services.xserver.displayManager.sddm = { 
    enable = true;
    theme = "${import ./features/sddm.nix {inherit pkgs;}}";
  };

  # WMs
  programs.sway.enable = true;
  programs.xwayland.enable = true;

  # Autostarts
  services.emacs.enable = true;

  # Remaps
  services.xremap = {
    withWlroots = true;
    userName = "ok";
    config = {
      keymap = [
        {
          name = "main";
          remap = {
            "CAPSLOCK" = "ESC";
          };
        }
      ];
    };
  };

  # Configure keymap in X11
  services.xserver = {
    exportConfiguration = true; 
    layout = "us, pk";
    xkbOptions = "grp:win_space_toggle";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };

    location.provider = "geoclue2";

  hardware.printers = {
    ensurePrinters = [
      {
        name = "Dell_1250c";
        location = "Home";
        deviceUri = "http://192.168.178.2:631/printers/Dell_1250c";
        model = "drv:///sample.drv/generic.ppd";
        ppdOptions = {
          PageSize = "A4";
        };
      }
    ];
    ensureDefaultPrinter = "Dell_1250c";
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ok = {
    isNormalUser = true;
    description = "ok";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      
    ];
  };


  # Fonts
  fonts.packages = [ pkgs.nerdfonts pkgs.nafees pkgs.noto-fonts-cjk-sans];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [

  (import ./scripts/screenshot.nix {inherit pkgs;})

  # sddm
  pkgs.libsForQt5.qt5.qtquickcontrols2
  pkgs.libsForQt5.qt5.qtgraphicaleffects

  # Window Manager (Sway)
  pkgs.waybar
  pkgs.swaylock
  pkgs.swayidle
  pkgs.wofi
  pkgs.rofi-wayland
  pkgs.alacritty
  pkgs.pfetch

# Web Browsers and Graphics
  pkgs.firefox
  pkgs.krita
  pkgs.inkscape
  pkgs.libresprite

# Text Editors and Version Control
  pkgs.git
  pkgs.lazygit
  pkgs.wget
  pkgs.neovim
  pkgs.emacs
  pkgs.python3
  pkgs.python311Packages.pip
  pkgs.imagemagick
  pkgs.tldr
  pkgs.texliveTeTeX
  pkgs.texlive.combined.scheme-full

# Utilities
  pkgs.p7zip
  pkgs.zip
  pkgs.unzip
  pkgs.killall
  pkgs.gnumake
  pkgs.cmake
  pkgs.xorg.libX11.dev
  pkgs.wl-clipboard
  pkgs.gcc
  pkgs.nodejs_21
  pkgs.brightnessctl
  pkgs.mako
  pkgs.libnotify
  pkgs.udiskie

# Multimedia
  pkgs.mpv
  pkgs.zathura
  pkgs.feh
  pkgs.cmus
  pkgs.cava
  pkgs.blanket
  pkgs.mangal
  pkgs.spotify
  pkgs.ytfzf
  pkgs.qbittorrent
  pkgs.xfce.thunar

# Screen Capture
  pkgs.grim
  pkgs.slurp
  pkgs.swappy

# Games
  pkgs.lutris
  pkgs.wine
  pkgs.steam-tui
  pkgs.ttyper

# Office Suite
  pkgs.libreoffice-fresh

# Communication
  pkgs.thunderbird
  pkgs.armcord
  pkgs.cordless

# Books
  pkgs.anki
  pkgs.drawio

# Mecilinious
  pkgs.zsh-syntax-highlighting
  pkgs.nix-prefetch
  pkgs.nix-prefetch-github

  ];

  environment.variables = {
    CPLUS_INCLUDE_PATH = "${pkgs.gtest.dev}/include";
    LIBRARY_PATH = "${pkgs.gtest}/lib";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  users.defaultUserShell=pkgs.zsh; 

  programs = {
    zsh = {
      enable = true;
    };
  };

  programs.steam = {
     enable = true;
     remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
     dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
   };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
