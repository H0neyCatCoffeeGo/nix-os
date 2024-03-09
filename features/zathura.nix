{ pkgs, config, ... }:

{
  programs.zathura =
    let
      colors = config.colorScheme.colors;
    in {
      enable = true;
      options = {
        font = "JetBrainsMono Nerd Font 12";
        notification-error-bg = "#1d2021"; # bg
        notification-error-fg = "#fb4934"; # bright:red
        notification-warning-bg = "#1d2021"; # bg
        notification-warning-fg = "#fabd2f"; # bright:yellow
        notification-bg = "#1d2021"; # bg
        notification-fg = "#b8bb26"; # bright:green
        completion-bg = "#504945"; # bg2
        completion-fg = "#ebdbb2"; # fg
        completion-group-bg = "#3c3836"; # bg1
        completion-group-fg = "#928374"; # gray
        completion-highlight-bg = "#83a598"; # bright:blue
        completion-highlight-fg = "#504945"; # bg2
        index-bg = "#504945"; # bg2
        index-fg = "#ebdbb2"; # fg
        index-active-bg = "#83a598"; # bright:blue
        index-active-fg = "#504945"; # bg2
        inputbar-bg = "#1d2021"; # bg
        inputbar-fg = "#ebdbb2"; # fg
        statusbar-bg = "#504945"; # bg2
        statusbar-fg = "#ebdbb2"; # fg
        highlight-color = "#fabd2f"; # bright:yellow
        highlight-active-color = "#fe8019"; # bright:orange
        default-bg = "#1d2021"; # bg
        default-fg = "#ebdbb2"; # fg
        render-loading = true;
        render-loading-bg = "#1d2021"; # bg
        render-loading-fg = "#ebdbb2"; # fg
        recolor-lightcolor = "#1d2021"; # bg
        recolor-darkcolor = "#ebdbb2"; # fg
        recolor = true;
      };
    };
}
