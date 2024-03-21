{ pkgs, config, ... }:
{
  programs.swaylock = 
    let colors = config.colorScheme.colors;
    in {
    enable = true;
    settings = {
      image = "~/.wallpaper/pixelForest.png";
      font = "JetBrainsMono NF";
      font-size = 14;
      indicator-idle-visible = false;
      indicator-radius = 50;
      indicator-thickness = 10;
      line-color = "${colors.base06}";
      color = "${colors.base00}";
      inside-color = "${colors.base01}";
      inside-caps-lock-color = "${colors.base02}";
      inside-ver-color = "${colors.base0D}";
      inside-wrong-color = "${colors.base08}";
      key-hl-color = "${colors.base0D}";
      ring-color = "${colors.base01}";
      ring-ver-color = "${colors.base0D}";
      ring-wrong-color = "${colors.base08}";
      text-color = "${colors.base00}";
      show-failed-attempts = true;
    };
  };
}
