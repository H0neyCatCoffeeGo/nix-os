{ pkgs, config, ... }:

{
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    font = {
      normal = {
        family = "consolas";
      };
      bold = {
        family = "JetBrainsMono Nerd Font";
      };
    size = 12;
    };
    colors = with config.colorScheme.colors; {
      bright = {
        black = "0x${base03}";
        red = "0x${base08}";
        green = "0x${base0B}";
        yellow = "0x${base0A}";
        blue = "0x${base0D}";
        magenta = "0x${base0E}";
        cyan = "0x${base0C}";
        white = "0x${base07}";
      };
      cursor = {
        cursor = "0x${base06}";
        text = "0x${base06}";
      };
      normal = {
        black = "0x${base00}";
        red = "0x${base08}";
        green = "0x${base0B}";
        yellow = "0x${base0A}";
        blue = "0x${base0D}";
        magenta = "0x${base0E}";
        cyan = "0x${base0C}";
        white = "0x${base06}";
      };
      primary = {
        background = "0x${base00}";
        foreground = "0x${base06}";
      };
    };
  };
}
