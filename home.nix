{config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ok";
  home.homeDirectory = "/home/ok";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./features/waybar.nix
    ./features/wofi.nix
    ./features/theme.nix
    ./features/alacritty.nix
    ./features/sway-lock.nix
    ./features/zathura.nix
    ./features/shell.nix
    ./features/mako.nix
    ./features/spotify.nix
    ./features/rofi.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;

#  colorScheme = {
#    slug = "monochrome";
#    name = "Monochrome";
#    author = "Your Name (https://github.com/yourgithub)";
#    palette = {
#      base00 = "#000000";
#      base01 = "#111111";
#      base02 = "#222222";
#      base03 = "#333333";
#      base04 = "#777777";
#      base05 = "#999999";
#      base06 = "#BBBBBB";
#      base07 = "#DDDDDD";
#      base08 = "#444444";
#      base09 = "#555555";
#      base0A = "#666666";
#      base0B = "#888888";
#      base0C = "#AAAAAA";
#      base0D = "#CCCCCC";
#      base0E = "#EEEEEE";
#      base0F = "#FFFFFF";
#   };
# };

#  colorScheme = {
#    slug = "Catppuccin";
#    name = "Mocha";
#    author = "https://github.com/catppuccin/base16/blob/main/base16/mocha.yaml";
#    palette = {
#      base00 =  "#1e1e2e"; # base
#      base01 =  "#181825"; # mantle
#      base02 =  "#313244"; # surface0
#      base03 =  "#45475a"; # surface1
#      base04 =  "#585b70"; # surface2
#      base05 =  "#cdd6f4"; # text
#      base06 =  "#f5e0dc"; # rosewater
#      base07 =  "#b4befe"; # lavender
#      base08 =  "#f38ba8"; # red
#      base09 =  "#fab387"; # peach
#      base0A =  "#f9e2af"; # yellow
#      base0B =  "#a6e3a1"; # green
#      base0C =  "#94e2d5"; # teal
#      base0D =  "#89b4fa"; # blue
#      base0E =  "#cba6f7"; # mauve
#      base0F =  "#f2cdcd"; # flamingo
#    };
#  };

  services.gammastep = {
   enable = true;
   provider = "manual";
   latitude = 31.55800000;
   longitude = 74.3507100;
  };

  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ok/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "lvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
