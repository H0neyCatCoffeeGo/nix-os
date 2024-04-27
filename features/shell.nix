{ pkgs, config, ... }:

{
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
      theme = "gallois";
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
    initExtra = "export PATH=$PATH:~/.local/bin/";
  };
}
