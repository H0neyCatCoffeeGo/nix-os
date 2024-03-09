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
  ];

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;

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

  # Programmes

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      nxrbld = "sudo nixos-rebuild switch --flake ~/.dotfiles#Shit";
      hmrbd  = "home-manager switch --flake ~/.dotfiles#ok";
    };
    initExtra = "export PATH=$PATH:~/.local/bin/";
    bashrcExtra = ''export FZF_DEFAULT_OPTS="--color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"
                    '';

    shellOptions = [
      "histappend"
      "checkwinsize"
      "extglob"
      "globstar"
      "checkjobs"
    ];
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
    prezto.prompt = {
      theme = "gruvbox";
    };
    shellAliases = {
      ll = "ls -la";
      nxrbld = "sudo nixos-rebuild switch --flake ~/.dotfiles#Shit";
      hmrbd  = "home-manager switch --flake ~/.dotfiles#ok";
    };
  plugins = [
    {
      # will source zsh-autosuggestions.plugin.zsh
      name = "zsh-autosuggestions";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-autosuggestions";
        rev = "v0.4.0";
        sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
      };
    }
  ];
    initExtra = "export PATH=$PATH:~/.local/bin/
                  ~/Code/Quote_fetch/a.out";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
